-- Initializes a new terminal window with either Julia or R
on quitTermSession(terminalEmu, termId)
  if terminalEmu equals "Terminal.app" then
    tell application "Terminal"
      close (window id termId) saving no
    end tell
  else if terminalEmu equals "iTerm.app" then
    tell application "Finder"
      display dialog "iTerm is not yet supported. Please choose Terminal.app instead."
    end tell
  end if
end quitTermSession

-- Call the initialization function
quitTermSession(term, termId)
