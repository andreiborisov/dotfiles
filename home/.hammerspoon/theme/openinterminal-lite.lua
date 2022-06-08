-- Set OpenInTerminal-Lite Finder icon
local function setOpenInTerminalLiteIcon(isDarkMode)
  -- Path to the app
  local app = "/Applications/OpenInTerminal-Lite.app"
  -- Path to icons
  local iconsFolder = hs.fs.currentDir() .. "/theme/assets/icons"
  -- Remove existing attribute and icon
  hs.execute("setfile -a c " .. app)
  os.remove(app .. "/Icon\r")
  -- Create a temp folder
  local tempFolder = string.gsub(hs.execute("mktemp -d"), "\n", "")
  -- Swap icon
  if isDarkMode then
    -- Copy the icon to the temp folder
    hs.execute("cp " .. iconsFolder .. "/icon_iterm_dark.icns " .. tempFolder .. "/icon.icns")
  else
    -- Copy the icon to the temp folder
    hs.execute("cp " .. iconsFolder .. "/icon_iterm_light.icns " .. tempFolder .. "/icon.icns")
  end
  -- Generate rsrc icon
  hs.execute("sips -i " .. tempFolder .. "/icon.icns")
  -- Save icon to a temp file
  hs.execute("derez -only icns " .. tempFolder .. "/icon.icns > " .. tempFolder .. "/icon.rsrc")
  -- Save icon to a resource fork
  hs.execute("rez -append -ov " .. tempFolder .. "/icon.rsrc -o " .. app .. "/Icon\r")
  -- Mark Icon\r file as invisible
  hs.execute("setfile -a V " .. app .. "/Icon\r")
  -- Mark that app bundle has custom icon
  hs.execute("setfile -a C " .. app)
  -- Remove the temp folder
  os.remove(tempFolder)
end

return setOpenInTerminalLiteIcon
