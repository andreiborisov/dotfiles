-- Utility function to read JSON files
local function readJSONFile(fileName)
  local file = assert(io.open(fileName, "r"))
  local result = hs.json.decode(file:read("*all"))
  file:close()
  return result
end

-- Utility function to write JSON files
local function writeJSONFile(fileName, table)
  local file = assert(io.open(fileName, "w"))
  file:write(hs.json.encode(table, true))
  file:close()
end

-- Set VS Code color theme
local function setCodeColorTheme(isDarkMode)
  -- Path to VS Code settings file
  local settingsFile = os.getenv("HOME") ..
    "/Library/Application Support/Code/User/settings.json"
  -- Read current settings
  local settings = readJSONFile(settingsFile)
  -- Choose theme based on the current system appearance
  if isDarkMode then
    -- Set color theme to "ayu mirage"
    settings["workbench.colorTheme"] = "Ayu Mirage"
  else
    -- Set color theme to "ayu light"
    settings["workbench.colorTheme"] = "Ayu Light"
  end
  -- Save new settings
  writeJSONFile(settingsFile, settings)
end

return setCodeColorTheme
