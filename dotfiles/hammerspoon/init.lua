hs.loadSpoon("SpoonInstall")
	
spoon.SpoonInstall:andUse("AppLauncher", {
  config = {
  	modifiers = {"ctrl", "cmd"}
  },
  hotkeys = {
    f = "Finder",
    c = "Calendar",
    d = "Discord",
    j = "Brave Browser",
    k = "Visual Studio Code",
    n = "Notes",
    p = "1Password",
    l = "Kitty",
    z = "Zoom.us",
    h = "Google Chat",
    m = "Mail",
    s = "Messages",
  }
})


