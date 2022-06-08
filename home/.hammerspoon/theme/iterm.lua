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

-- Set iTerm dynamic profile to inherit from another dynamic profile
local function setItermDynamicProfile(isDarkMode)
  -- Path to file with declaration for active dynamic profile (see
  -- https://www.iterm2.com/documentation-dynamic-profiles.html)
  local settingsFile = os.getenv("HOME") ..
    "/Library/Application Support/iTerm2/DynamicProfiles/Dynamic.json"
  -- Read current dynamic profile declarations
  local settings = readJSONFile(settingsFile)
  -- Find and set parent profile for the current dynamic profile
  for i, profile in ipairs(settings["Profiles"]) do
    if profile["Name"] == "Dynamic ayu" then
      if isDarkMode then
        -- Set profile with ayu mirage color scheme as a parent profile for the current dynamic
        -- profile
        profile["Dynamic Profile Parent Name"] = "ayu mirage"
      else
        -- Set profile with ayu light color scheme as a parent profile for the current dynamic
        -- profile
        profile["Dynamic Profile Parent Name"] = "ayu light"
      end
      break
    end
  end
  -- Save modified dynamic profile declarations
  writeJSONFile(settingsFile, settings)
end

return setItermDynamicProfile
