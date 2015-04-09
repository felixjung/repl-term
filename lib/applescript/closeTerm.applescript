-- Initializes a new terminal window with either Julia or R
on quitTermSession(terminalEmu, termId)
  tell application "Terminal"
    close (window id termId) saving no
  end tell
end quitTermSession

-- Call the initialization function
quitTermSession(term, termId)
