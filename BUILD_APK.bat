@echo off
chcp 65001 >nul
echo ========================================
echo    BAZAAR WATAN ANDROID APK BUILD
echo ========================================
echo.

:: Renk kodları
set GREEN=[92m
set RED=[91m
set YELLOW=[93m
set RESET=[0m

echo %YELLOW%▶ Flutter temizleniyor...%RESET%
call flutter clean

echo.
echo %YELLOW%▶ Bağımlılıklar yükleniyor...%RESET%
call flutter pub get

echo.
echo %YELLOW%▶ Release APK oluşturuluyor...%RESET%
echo.
call flutter build apk --release --split-per-abi

echo.
if %ERRORLEVEL% EQU 0 (
    echo %GREEN%========================================%RESET%
    echo %GREEN%   ✓ APK BAŞARIYLA OLUŞTURULDU!%RESET%
    echo %GREEN%========================================%RESET%
    echo.
    echo %YELLOW%APK Dosyaları:%RESET%
    echo.
    dir /b build\app\outputs\flutter-apk\*.apk
    echo.
    echo %YELLOW%Konum:%RESET% build\app\outputs\flutter-apk\
    echo.
    echo %GREEN%Google Play'e yüklemek için hazır!%RESET%
    echo.
    
    :: APK'ları masaüstüne kopyala
    echo %YELLOW%▶ APK'lar masaüstüne kopyalanıyor...%RESET%
    xcopy /Y build\app\outputs\flutter-apk\*.apk "%USERPROFILE%\Desktop\"
    echo.
    echo %GREEN%✓ APK'lar masaüstüne kopyalandı!%RESET%
    
) else (
    echo %RED%========================================%RESET%
    echo %RED%   ✗ HATA: Build başarısız!%RESET%
    echo %RED%========================================%RESET%
)

echo.
pause



