-- Set macOS system UI accent and highlight colors
local function setSystemColors(isDarkMode)
  -- Choose system colors based on the current system appearance
  local accentColor, highlightColor
  if isDarkMode then
    -- Yellow accent color
    accentColor = "2"
    -- Yellow highlight color
    highlightColor = "1.000000 0.937255 0.690196 Yellow"
  else
    -- Orange accent color
    accentColor = "1"
    -- Orange highlight color
    highlightColor = "1.000000 0.874510 0.701961 Orange"
  end
  -- Set accent color using defaults utility
  hs.execute(string.format("defaults write -g AppleAccentColor -int %s", accentColor))
  -- Set highlight color using defaults utility
  hs.execute(string.format("defaults write -g AppleHighlightColor -string '%s'", highlightColor))
  -- Set legacy "appearance" property. This property doesn't have any actuall effect in Mojave, but
  -- setting it refreshes system UI colors
  hs.osascript.javascript("Application('System Events').appearancePreferences.appearance.set('blue')")
end

return setSystemColors
