-- Initializes a new terminal window with either Julia or R
on checkTerminal(termEmu, termId)
  tell application  "Terminal"
    if window id termId exists
      return true
    else
      return false
    end if
  end tell
end checkTerminal

-- Call the initialization function
checkTerminal(term, termId)
