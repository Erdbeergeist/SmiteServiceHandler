TraySetState(2)

$launchcommand="SteamLauncherUI.exe"

for $i = 1 To $CmdLine[0]
	$launchcommand = $launchcommand & " " & $CmdLine[$i]
Next


FileMove("SteamLauncherUI.exe","Grabber.exe")
FileMove("SteamLauncherUIorig.exe","SteamLauncherUI.exe")

RunWait("net start HiPatchService")

Do
	sleep(200)
Until  (FileExists("SteamLauncherUI.exe") and  FileExists("Grabber.exe"))

Run($launchcommand)

ProcessWait("SteamLauncherUI.exe",20)
while (ProcessExists("Smite.exe") or ProcessExists("SteamLauncherUI.exe"))
	sleep(2000)
WEnd
RunWait("net stop HiPatchService")


FileMove("SteamLauncherUI.exe","SteamLauncherUIorig.exe")
FileMove("Grabber.exe","SteamLauncherUI.exe")

