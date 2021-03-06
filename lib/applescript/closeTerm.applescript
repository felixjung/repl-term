-- Initializes a new terminal window with either Julia or R
on quitTermSession(terminalEmu, termId)
  if terminalEmu equals "Terminal.app" then
    tell application "Terminal"
      close (window id termId) saving no
    end tell
  else if terminalEmu equals "iTerm.app" then
    set iTermLibrary to (load script file "iTermLibrary.applescript")
    tell application "iTerm"
    end tell
  end if
end quitTermSession

-- Call the initialization function
quitTermSession(term, termId)
