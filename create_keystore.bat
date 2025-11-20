@echo off
echo ========================================
echo BAZAAR WATAN - KEYSTORE OLUSTURMA
echo ========================================
echo.
echo Keystore olusturuluyor...
echo.

cd android\app

keytool -genkey -v -keystore bazaarew-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias bazaarew-key-alias

echo.
echo ========================================
echo KEYSTORE BASARIYLA OLUSTURULDU!
echo ========================================
echo.
echo Dosya Konumu: android\app\bazaarew-release-key.jks
echo.
echo ONEMLI: Bu dosyayi ve sifreleri GUVENLİ bir yerde saklayin!
echo Bu anahtari kaybederseniz uygulamayi guncelleyemezsiniz!
echo.
pause



