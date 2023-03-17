#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Change2CUI=y
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; *** Start added by AutoIt3Wrapper ***
#include <FileConstants.au3>
; *** End added by AutoIt3Wrapper ***
#cs ----------------------------------------------------------------------------
 AutoIt Version: 3.3.15.0 (Beta)
 Author:         myName
 Script Function:
	Template AutoIt script.
#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <File.au3>
$shutdown = False
$restart = False
$logoff = False
$nothing = False

If $CmdLine[0] = 1 Then
	If $CmdLine[1] = "/?" Then
		ConsoleWrite ( 'cinstall.exe [/s][/r][/l][/n]' & @CRLF & "Microsoft Visual C++ Redistributable installation tool" & @CRLF & "This tool is will install all of the Microsoft Visual C++ Redistributable packages that are currently available.  It accepts only one argument, which indicates the action that should be performed after the installations are complete." & @CRLF & "/s:" & @TAB & "Shutdown the computer" & @CRLF & "/r:" & @TAB & "Restart the computer" & @CRLF & "/l:" & @TAB & "Log off the current user profile" & @CRLF & "/n:" & @TAB & "Do nothing" & @CRLF )
		Exit
	ElseIf $CmdLine[1] = "/s" Then
		$shutdown = True
	ElseIf $CmdLine[1] = "/r" Then
		$restart = True
	ElseIf $CmdLine[1] = "/l" Then
		$logoff = True
	ElseIf $CmdLine[1] = "/n" Then
		$nothing = True
	Else
		ConsoleWriteError ( 'Invalid argument specified.  Run "cinstall.exe /?" to see help content' & @CRLF )
	EndIf
Else
	$nothing = True
EndIf


ConsoleWrite ( "Getting everything ready to go.  If the device on which you are running this tool did not recently have a new operating system deployed to it and if you have not done so already, it is highly advisable that you quit the tool (using CTRL + C) and uninstall all of the Microsoft Visual C++ Redistributables on your machine prior to using this tool." & @CRLF )
Sleep ( 3000 )
DirCreate ( @TempDir & "\visualClib" )
FileInstall ( "C:\Users\whiggs\OneDrive\visualc\1_1vcredist_x86.exe", @TempDir & "\visualClib\1_1vcredist_x86.exe")
If @CPUArch = "X64" Then
	FileInstall ( "C:\Users\whiggs\OneDrive\visualc\1_2vcredist_x64.exe", @TempDir & "\visualClib\1_2vcredist_x64.exe")
EndIf
FileInstall ( "C:\Users\whiggs\OneDrive\visualc\2_1vcredist_x86.exe", @TempDir & "\visualClib\2_1vcredist_x86.exe")
If @CPUArch = "X64" Then
	FileInstall ( "C:\Users\whiggs\OneDrive\visualc\2_2vcredist_x64.exe", @TempDir & "\visualClib\2_2vcredist_x64.exe")
EndIf
FileInstall ( "C:\Users\whiggs\OneDrive\visualc\3_1vcredist_x86.exe", @TempDir & "\visualClib\3_1vcredist_x86.exe")
If @CPUArch = "X64" Then
	FileInstall ( "C:\Users\whiggs\OneDrive\visualc\3_2vcredist_x64.exe", @TempDir & "\visualClib\3_2vcredist_x64.exe")
EndIf
FileInstall ( "C:\Users\whiggs\OneDrive\visualc\4_1vcredist_x86.exe", @TempDir & "\visualClib\4_1vcredist_x86.exe")
If @CPUArch = "X64" Then
	FileInstall ( "C:\Users\whiggs\OneDrive\visualc\4_2vcredist_x64.exe", @TempDir & "\visualClib\4_2vcredist_x64.exe")
EndIf
FileInstall ( "C:\Users\whiggs\OneDrive\visualc\5_1vcredist_x86.exe", @TempDir & "\visualClib\5_1vcredist_x86.exe")
If @CPUArch = "X64" Then
	FileInstall ( "C:\Users\whiggs\OneDrive\visualc\5_2vcredist_x64.exe", @TempDir & "\visualClib\5_2vcredist_x64.exe")
EndIf
FileInstall ( "C:\Users\whiggs\OneDrive\visualc\6_1vc_redist.x86.exe", @TempDir & "\visualClib\6_1vc_redist.x86.exe")
If @CPUArch = "X64" Then
	FileInstall ( "C:\Users\whiggs\OneDrive\visualc\6_2vc_redist.x64.exe", @TempDir & "\visualClib\6_2vc_redist.x64.exe")
EndIf
FileInstall ( "C:\Users\whiggs\OneDrive\visualc\7_1vc_redist.x86.exe", @TempDir & "\visualClib\7_1vc_redist.x86.exe")
If @CPUArch = "X64" Then
	FileInstall ( "C:\Users\whiggs\OneDrive\visualc\7_2vc_redist.x64.exe", @TempDir & "\visualClib\7_2vc_redist.x64.exe")
EndIf
FileInstall ( "C:\Users\whiggs\OneDrive\visualc\8_1vc_redist.x86.exe", @TempDir & "\visualClib\8_1vc_redist.x86.exe")
If @CPUArch = "X64" Then
	FileInstall ( "C:\Users\whiggs\OneDrive\visualc\8_2vc_redist.x64.exe", @TempDir & "\visualClib\8_2vc_redist.x64.exe")
EndIf

$files = _FileListToArray ( @TempDir & "\visualClib", "*", $FLTA_FILES )
For $i = 1 To $files[0] Step 1
	$param = ""
	If StringLeft ( $files[$i], 1 ) = "1" Then
		If StringMid ( $files[$i], 3, 1 ) = "1" Then
			ConsoleWrite ( "Installing Visual C++ 2005 x86" & @CRLF )
		Else
			ConsoleWrite ( "Installing Visual C++ 2005 x64" & @CRLF )
		EndIf
		$param = "/Q"
	ElseIf StringLeft ( $files[$i], 1 ) = "2" Then
		If StringMid ( $files[$i], 3, 1 ) = "1" Then
			ConsoleWrite ( "Installing Visual C++ 2008 x86" & @CRLF )
		Else
			ConsoleWrite ( "Installing Visual C++ 2008 x64" & @CRLF )
		EndIf
		$param = "/q"
	ElseIf StringLeft ( $files[$i], 1 ) = "3" Then
		If StringMid ( $files[$i], 3, 1 ) = "1" Then
			ConsoleWrite ( "Installing Visual C++ 2010 x86" & @CRLF )
		Else
			ConsoleWrite ( "Installing Visual C++ 2010 x64" & @CRLF )
		EndIf
		$param = "/q /norestart"
	ElseIf StringLeft ( $files[$i], 1 ) = "4" Then
		If StringMid ( $files[$i], 3, 1 ) = "1" Then
			ConsoleWrite ( "Installing Visual C++ 2012 x86" & @CRLF )
		Else
			ConsoleWrite ( "Installing Visual C++ 2012 x64" & @CRLF )
		EndIf
		$param = "/install /quiet /norestart"
	ElseIf StringLeft ( $files[$i], 1 ) = "5" Then
		If StringMid ( $files[$i], 3, 1 ) = "1" Then
			ConsoleWrite ( "Installing Visual C++ 2013 x86" & @CRLF )
		Else
			ConsoleWrite ( "Installing Visual C++ 2013 x64" & @CRLF )
		EndIf
		$param = "/install /quiet /norestart"
	ElseIf StringLeft ( $files[$i], 1 ) = "6" Then
		If StringMid ( $files[$i], 3, 1 ) = "1" Then
			ConsoleWrite ( "Installing Visual C++ 2015 x86" & @CRLF )
		Else
			ConsoleWrite ( "Installing Visual C++ 2015 x64" & @CRLF )
		EndIf
		$param = "/install /quiet /norestart"
	ElseIf StringLeft ( $files[$i], 1 ) = "7" Then
		If StringMid ( $files[$i], 3, 1 ) = "1" Then
			ConsoleWrite ( "Installing Visual C++ 2017 x86" & @CRLF )
		Else
			ConsoleWrite ( "Installing Visual C++ 2017 x64" & @CRLF )
		EndIf
		$param = "/install /quiet /norestart"
	ElseIf StringLeft ( $files[$i], 1 ) = "8" Then
		If StringMid ( $files[$i], 3, 1 ) = "1" Then
			ConsoleWrite ( "Installing Visual C++ 2019 x86" & @CRLF )
		Else
			ConsoleWrite ( "Installing Visual C++ 2019 x64" & @CRLF )
		EndIf
		$param = "/install /quiet /norestart"
	Else
	EndIf

	ShellExecuteWait ( $files[$i], $param, @TempDir & "\visualClib", Default, @SW_SHOW )
Next
DirRemove ( @TempDir & "\visualClib", 1 )
ConsoleWrite ( "In order to complete the installation, the computer will need to restart at some point.  Its best to do that as soon as possible." & @CRLF )
If $restart Then
	ConsoleWrite ( "Computer will be restarting in less than a minute. Please save your work." & @CRLF )
	Sleep ( 30000 )
	Shutdown ( 18 )
ElseIf $shutdown Then
	ConsoleWrite ( "Computer will be shutting down in less than a minute. Please save your work." & @CRLF )
	Sleep ( 30000 )
	Shutdown ( 17 )
ElseIf $logoff Then
	ConsoleWrite ( "Computer will be logging off in less than a minute. Please save your work." & @CRLF )
	Sleep ( 30000 )
	Shutdown ( 16 )
Else
	Exit
EndIf
