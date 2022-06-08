local function watchFinder(appName, eventType, appObject)
  if (appName == "Finder") then
    if (eventType == hs.application.watcher.activated) then
      -- Bring all Finder windows forward when one gets activated
      appObject:selectMenuItem({"Window", "Bring All to Front"})
    end
  end
end

local finderWatcher = hs.application.watcher.new(watchFinder)
finderWatcher:start()
