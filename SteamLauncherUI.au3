$launchcommand="SmiteServiceHandler.exe"
for $i = 1 To $CmdLine[0]
	$launchcommand = $launchcommand & " " & $CmdLine[$i]
Next

Run($launchcommand)