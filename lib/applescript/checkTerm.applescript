-- Initializes a new terminal window with either Julia or R
on checkTerminal(termEmu, termId)
  if termEmu equals "Terminal.app" then
    tell application  "Terminal"
      if window id termId exists
        return true
      else
        return false
      end if
    end tell
  else if termEmu equals "iTerm.app" then
    tell application "Finder"
      display dialog "iTerm.app is not supported, yet. Please choose Terminal.app"
    end tell
  end if
end checkTerminal

-- Call the initialization function
checkTerminal(term, termId)
