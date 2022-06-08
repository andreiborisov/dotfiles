local modules = {}
local iterFn, dirObj = hs.fs.dir(hs.fs.currentDir() .. "/theme")
if iterFn then
  for path in iterFn, dirObj do
    if string.match(path, "%.lua") then
      table.insert(modules, require("theme/" .. string.sub(path, 1, -5)))
    end
  end
end

hs.loadSpoon("DarkMode")
spoon.DarkMode.callbackFn = function(isDarkMode)
  for i, setTheme in ipairs(modules) do
    setTheme(isDarkMode)
  end
end
spoon.DarkMode:bindHotkeys({toggle = {{"ctrl", "cmd"}, "d"}})
spoon.DarkMode:init()
spoon.DarkMode:start()
