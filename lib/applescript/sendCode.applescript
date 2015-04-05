-- Sends a Code to a Terminal session with a specific window and tab id.
on sendCode(termEmu, code, termId)
  if termEmu equals "Terminal.app" then
    tell application "Terminal"
      do script code in window id termId
    end tell
  else
    tell application "Finder"
      display dialog "iTerm is not yet supported. Please choose Terminal.app instead."
    end tell
  end if
end sendCode

-- Call the function
sendCode(term, code, termId)
