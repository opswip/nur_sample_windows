@REM Download latest NUR API libraries from GitHub.

@SET GETTER=wget.exe
@SET SDK_REPO=nur_sdk
@SET REMOTE_BASE=https://github.com/NordicID/%SDK_REPO%/raw/master
@SET LOCAL_IMPORTDIR=import

%GETTER% -q %REMOTE_BASE%/dotnet/ReleaseNotes.txt -O %LOCAL_IMPORTDIR%\dotnet\ReleaseNotes.txt
%GETTER% -q %REMOTE_BASE%/native/ReleaseNotes.txt -O %LOCAL_IMPORTDIR%\win_native\ReleaseNotes.txt

@REM ********************************************
@REM Windows CE / WEC .NET API
@REM ********************************************

@REM Target: dotnet\dotnet_cf_vs2005\NurApiDotNetWCE.dll
%GETTER% -q %REMOTE_BASE%/dotnet/windowsce/CF20/NurApiDotNetWCE.dll -O %LOCAL_IMPORTDIR%\dotnet\dotnet_cf_vs2005\NurApiDotNetWCE.dll

@REM Target: dotnet\dotnet_cf_vs2005\NurApiDotNetWCE.XML
%GETTER% -q %REMOTE_BASE%/dotnet/windowsce/CF20/NurApiDotNetWCE.XML -O %LOCAL_IMPORTDIR%\dotnet\dotnet_cf_vs2005\NurApiDotNetWCE.XML

@REM Target: dotnet\dotnet_cf_vs2008\NurApiDotNetWCE.dll
%GETTER% -q %REMOTE_BASE%/dotnet/windowsce/CF35/NurApiDotNetWCE.dll -O %LOCAL_IMPORTDIR%\dotnet\dotnet_cf_vs2008\NurApiDotNetWCE.dll

@REM Copy XML help from VS2005
@copy %LOCAL_IMPORTDIR%\dotnet\dotnet_cf_vs2005\NurApiDotNetWCE.XML %LOCAL_IMPORTDIR%\dotnet\dotnet_cf_vs2008\ /y

@REM ********************************************
@REM Windows .NET API
@REM ********************************************
@SET LOCAL_TARGET_BASE=%LOCAL_IMPORTDIR%\dotnet\dotnet_windows

@REM Target: %LOCAL_TARGET_BASE%\AnyCPU\NurApiDotNet.dll
%GETTER% -q %REMOTE_BASE%/dotnet/anycpu/NurApiDotNet.dll -O %LOCAL_TARGET_BASE%\AnyCPU\NurApiDotNet.dll

@REM Target: %LOCAL_TARGET_BASE%\x64\NurApiDotNet.dll
%GETTER% -q %REMOTE_BASE%/dotnet/x64/NurApiDotNet.dll -O %LOCAL_TARGET_BASE%\x64\NurApiDotNet.dll

@REM Target: %LOCAL_TARGET_BASE%\x86_ansi\NurApiDotNet.dll
%GETTER% -q %REMOTE_BASE%/dotnet/x86_ansi/NurApiDotNet.dll -O %LOCAL_TARGET_BASE%\x86_ansi\NurApiDotNet.dll

@REM Target: %LOCAL_TARGET_BASE%\x86\NurApiDotNet.dll
%GETTER% -q %REMOTE_BASE%/dotnet/x86/NurApiDotNet.dll -O %LOCAL_TARGET_BASE%\x86\NurApiDotNet.dll

@REM Target: %LOCAL_TARGET_BASE%\x86\NurApiDotNet.XML
%GETTER% -q %REMOTE_BASE%/dotnet/x86/NurApiDotNet.XML -O %LOCAL_TARGET_BASE%\x86\NurApiDotNet.XML

@REM Copy XML help from x86
@copy %LOCAL_TARGET_BASE%\x86\NurApiDotNet.XML %LOCAL_TARGET_BASE%\AnyCPU\ /y
@copy %LOCAL_TARGET_BASE%\x86\NurApiDotNet.XML %LOCAL_TARGET_BASE%\x64\ /y
@copy %LOCAL_TARGET_BASE%\x86\NurApiDotNet.XML %LOCAL_TARGET_BASE%\x86_ansi\ /y

@REM UWP dll & xml
%GETTER% -q %REMOTE_BASE%/dotnet/UWP_Win10/AnyCPU/NurApiDotNetUWP.dll -O %LOCAL_TARGET_BASE%\UWP_Win10\AnyCPU\NurApiDotNetUWP.dll
%GETTER% -q %REMOTE_BASE%/dotnet/UWP_Win10/AnyCPU/NurApiDotNetUWP.XML -O %LOCAL_TARGET_BASE%\UWP_Win10\AnyCPU\NurApiDotNetUWP.XML

@REM *************
@REM Common native
@REM *************
@SET LOCAL_TARGET_BASE=%LOCAL_IMPORTDIR%\include
@SET REMOTE_DIR=%REMOTE_BASE%/native/include

%GETTER% -q %REMOTE_DIR%/NurAPI.h -O %LOCAL_TARGET_BASE%\NurAPI.h
%GETTER% -q %REMOTE_DIR%/NurAccessoryExtension.h -O %LOCAL_TARGET_BASE%\NurAccessoryExtension.h
%GETTER% -q %REMOTE_DIR%/NurAPIConstants.h -O %LOCAL_TARGET_BASE%\NurAPIConstants.h
%GETTER% -q %REMOTE_DIR%/NurAPIErrors.h -O %LOCAL_TARGET_BASE%\NurAPIErrors.h
%GETTER% -q %REMOTE_DIR%/NurAPIExport.h -O %LOCAL_TARGET_BASE%\NurAPIExport.h
%GETTER% -q %REMOTE_DIR%/NurOS.h -O %LOCAL_TARGET_BASE%\NurOS.h
%GETTER% -q %REMOTE_DIR%/NurOs_Linux.h -O %LOCAL_TARGET_BASE%\NurOs_Linux.h
%GETTER% -q %REMOTE_DIR%/NurOs_Win32.h -O %LOCAL_TARGET_BASE%\NurOs_Win32.h
%GETTER% -q %REMOTE_DIR%/NurOs_iOS.h -O %LOCAL_TARGET_BASE%\NurOs_iOS.h
%GETTER% -q %REMOTE_DIR%/NurOs_macOS.h -O %LOCAL_TARGET_BASE%\NurOs_macOS.h

@REM ******************
@REM Windows native API
@REM ******************
@SET LOCAL_TARGET_BASE=%LOCAL_IMPORTDIR%\win_native
@SET REMOTE_DIR=%REMOTE_BASE%/native/windows

@REM Win32
%GETTER% -q %REMOTE_DIR%/x86/NURAPI.dll -O %LOCAL_TARGET_BASE%\win32\NURAPI.dll
%GETTER% -q %REMOTE_DIR%/x86/NURAPI.lib -O %LOCAL_TARGET_BASE%\win32\NURAPI.lib

@REM Win x86_64
%GETTER% -q %REMOTE_DIR%/x64/NURAPI.dll -O %LOCAL_TARGET_BASE%\win64\NURAPI.dll
%GETTER% -q %REMOTE_DIR%/x64/NURAPI.lib -O %LOCAL_TARGET_BASE%\win64\NURAPI.lib

@REM WCE/WEC
%GETTER% -q %REMOTE_DIR%/arm/NURAPI.dll -O %LOCAL_TARGET_BASE%\windowsce\NURAPI.dll
%GETTER% -q %REMOTE_DIR%/arm/NURAPI.lib -O %LOCAL_TARGET_BASE%\windowsce\NURAPI.lib

@REM UWP ARM
%GETTER% -q %REMOTE_DIR%/UWP_Win10/ARM/NURAPI.dll -O %LOCAL_TARGET_BASE%\UWP_Win10\ARM\NURAPI.dll
%GETTER% -q %REMOTE_DIR%/UWP_Win10/ARM/NURAPI.lib -O %LOCAL_TARGET_BASE%\UWP_Win10\ARM\NURAPI.lib

@REM UWP x86
%GETTER% -q %REMOTE_DIR%/UWP_Win10/x86/NURAPI.dll -O %LOCAL_TARGET_BASE%\UWP_Win10\x86\NURAPI.dll
%GETTER% -q %REMOTE_DIR%/UWP_Win10/x86/NURAPI.lib -O %LOCAL_TARGET_BASE%\UWP_Win10\x86\NURAPI.lib

@REM UWP x64
%GETTER% -q %REMOTE_DIR%/UWP_Win10/x64/NURAPI.dll -O %LOCAL_TARGET_BASE%\UWP_Win10\x64\NURAPI.dll
%GETTER% -q %REMOTE_DIR%/UWP_Win10/x64/NURAPI.lib -O %LOCAL_TARGET_BASE%\UWP_Win10\x64\NURAPI.lib


@SET GETTER=
@SET REMOTE_DIR=
@SET REMOTE_DIR=
@REM @PAUSE