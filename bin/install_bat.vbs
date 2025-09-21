Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

If WScript.Arguments.Count < 2 Then
    WScript.Echo "Usage: install_to_start.vbs ""C:\Path\To\File.bat"" ""Shortcut Name"""
    WScript.Quit 1
End If

targetFile = WScript.Arguments(0)
shortcutName = WScript.Arguments(1)

If Not fso.FileExists(targetFile) Then
    WScript.Echo "Error: File not found: " & targetFile
    WScript.Quit 1
End If

startMenuPath = shell.SpecialFolders("Programs")
shortcutPath = fso.BuildPath(startMenuPath, shortcutName & ".lnk")

Set shortcut = shell.CreateShortcut(shortcutPath)
shortcut.TargetPath = targetFile
shortcut.WorkingDirectory = fso.GetParentFolderName(targetFile)
shortcut.IconLocation = "%SystemRoot%\System32\SHELL32.dll,94"  ' Optional default icon
shortcut.Save

WScript.Echo "Shortcut created: " & shortcutPath
