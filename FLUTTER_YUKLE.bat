@echo off
chcp 65001 >nul
echo ========================================
echo    FLUTTER SDK OTOMATIK KURULUM
echo ========================================
echo.

echo [1/4] Flutter SDK indiriliyor...
echo URL: https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.5-stable.zip
echo.
echo Bu islem 5-10 dakika surebilir...
echo.

:: Flutter'ı indir
powershell -Command "& {Invoke-WebRequest -Uri 'https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.5-stable.zip' -OutFile '%USERPROFILE%\Downloads\flutter_sdk.zip'}"

echo.
echo [2/4] Flutter SDK cikartiliyor...
powershell -Command "& {Expand-Archive -Path '%USERPROFILE%\Downloads\flutter_sdk.zip' -DestinationPath 'C:\' -Force}"

echo.
echo [3/4] PATH'e ekleniyor...
setx PATH "%PATH%;C:\flutter\bin" /M

echo.
echo [4/4] Flutter kontrol ediliyor...
C:\flutter\bin\flutter doctor

echo.
echo ========================================
echo   KURULUM TAMAMLANDI!
echo ========================================
echo.
echo Simdi terminali KAPAT ve YENİDEN AÇ!
echo Sonra BUILD_APK.bat'i calistir.
echo.
pause



