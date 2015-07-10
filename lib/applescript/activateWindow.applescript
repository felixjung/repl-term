-- Activates a specific terminal window
on focusTermWindow(terminalEmu, termName)
  property NSWorkspace : class "NSWorkspace"
  set workspace to NSWorkspace's sharedWorkspace()
  tell application "System Events"
      tell application process terminalEmu
          click menu item termName of menu of menu bar item "Window" of menu bar 1
          workspace's launchApplication_(terminalEmu)
      end tell
  end tell
end focusTermWindow

-- Call the focus function
set termName to "REPL Term"
set terminalEmu to "Terminal.app"

focusTermWindow(terminalEmu, termName)
