-- Sends a Code to a Terminal session with a specific window and tab id.
on sendCode(termEmu, code, termId)
  tell application "Terminal"
    do script code in window id termId
  end tell
end sendCode

-- Call the function
sendCode(term, code, termId)
