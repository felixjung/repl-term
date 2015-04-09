on getSessionById(sessionId)
  tell application "iTerm"
    repeat with term in every terminal
      tell term
   			repeat with sess in sessions
   				tell sess
   					set currentSessionId to get id
   					if currentSessionId is equal to sessionId then
   						return name of sess
   					end if
   				end tell
   			end repeat
   		end tell
    end repeat
  end tell
end getSessionById

set sessionId to "/dev/ttys001"

getSessionById(sessionId)
