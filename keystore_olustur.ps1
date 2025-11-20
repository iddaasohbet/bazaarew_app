# Keystore Oluşturma Scripti (Google Play için gerekli)

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Keystore Oluşturma" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Google Play'e yüklemek için uygulamanızı imzalamanız gerekir." -ForegroundColor Yellow
Write-Host ""

$keystorePath = "C:\Users\A\Desktop\bazaarew_app\android\bazaarewatan-key.jks"

if (Test-Path $keystorePath) {
    Write-Host "UYARI: Keystore zaten mevcut!" -ForegroundColor Red
    Write-Host "Mevcut keystore: $keystorePath" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Yeni keystore oluşturmak mevcut keystore'u geçersiz kılar." -ForegroundColor Red
    Write-Host "Devam etmek istiyor musunuz? (E/H)" -ForegroundColor Yellow
    $response = Read-Host
    
    if ($response -ne 'E' -and $response -ne 'e') {
        Write-Host "İptal edildi." -ForegroundColor Gray
        exit 0
    }
}

Write-Host ""
Write-Host "Lütfen aşağıdaki bilgileri girin:" -ForegroundColor Cyan
Write-Host ""

# Şifre
do {
    $password1 = Read-Host "Keystore Şifresi (min 6 karakter)" -AsSecureString
    $password2 = Read-Host "Şifre Tekrar" -AsSecureString
    
    $pwd1 = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
        [Runtime.InteropServices.Marshal]::SecureStringToBSTR($password1)
    )
    $pwd2 = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
        [Runtime.InteropServices.Marshal]::SecureStringToBSTR($password2)
    )
    
    if ($pwd1 -ne $pwd2) {
        Write-Host "Şifreler eşleşmiyor! Tekrar deneyin." -ForegroundColor Red
        Write-Host ""
    } elseif ($pwd1.Length -lt 6) {
        Write-Host "Şifre en az 6 karakter olmalı!" -ForegroundColor Red
        Write-Host ""
    }
} while ($pwd1 -ne $pwd2 -or $pwd1.Length -lt 6)

Write-Host ""

# İsim
$name = Read-Host "İsminiz"
$organization = Read-Host "Organizasyon (Şirket adı veya 'NA' yazın)"
$city = Read-Host "Şehir"
$state = Read-Host "Eyalet/Bölge (veya 'NA' yazın)"
$country = Read-Host "Ülke Kodu (örn: AF, TR)"

Write-Host ""
Write-Host "Keystore oluşturuluyor..." -ForegroundColor Yellow
Write-Host ""

# Java/Keytool kontrol
$keytool = $null

# Flutter'ın JDK'sini kullan
$flutterPath = "C:\src\flutter"
if (Test-Path "$flutterPath\bin\cache\dart-sdk\bin\dart.exe") {
    # Flutter JDK
    $possiblePaths = @(
        "$flutterPath\bin\cache\artifacts\java\bin\keytool.exe",
        "$env:JAVA_HOME\bin\keytool.exe",
        "C:\Program Files\Java\jdk-*\bin\keytool.exe"
    )
    
    foreach ($path in $possiblePaths) {
        if (Test-Path $path) {
            $keytool = $path
            break
        }
    }
}

if (!$keytool) {
    # Sistem PATH'teki keytool
    $keytool = Get-Command keytool -ErrorAction SilentlyContinue
    if ($keytool) {
        $keytool = $keytool.Source
    }
}

if (!$keytool) {
    Write-Host "HATA: keytool bulunamadı!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Java JDK kurulu değil. Lütfen şunu yapın:" -ForegroundColor Yellow
    Write-Host "1. Android Studio'da File > Settings > Appearance & Behavior > System Settings > Android SDK" -ForegroundColor White
    Write-Host "2. SDK Tools sekmesinde 'Android SDK Command-line Tools' yükleyin" -ForegroundColor White
    Write-Host ""
    Write-Host "Veya manuel olarak bu komutu çalıştırın:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host 'keytool -genkey -v -keystore "C:\Users\A\Desktop\bazaarew_app\android\bazaarewatan-key.jks" -keyalg RSA -keysize 2048 -validity 10000 -alias bazaarewatan' -ForegroundColor White
    exit 1
}

# Keystore oluştur
$dname = "CN=$name, OU=$organization, L=$city, ST=$state, C=$country"

& $keytool -genkey -v `
    -keystore $keystorePath `
    -keyalg RSA `
    -keysize 2048 `
    -validity 10000 `
    -alias bazaarewatan `
    -dname $dname `
    -storepass $pwd1 `
    -keypass $pwd1

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✓ Keystore oluşturuldu!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Keystore dosyası: $keystorePath" -ForegroundColor Cyan
    Write-Host ""
    
    # key.properties oluştur
    $keyPropertiesPath = "C:\Users\A\Desktop\bazaarew_app\android\key.properties"
    
    $keyPropertiesContent = @"
storePassword=$pwd1
keyPassword=$pwd1
keyAlias=bazaarewatan
storeFile=bazaarewatan-key.jks
"@
    
    Set-Content -Path $keyPropertiesPath -Value $keyPropertiesContent
    
    Write-Host "✓ key.properties oluşturuldu!" -ForegroundColor Green
    Write-Host ""
    
    # build.gradle'ı güncelle
    Write-Host "build.gradle dosyası güncelleniyor..." -ForegroundColor Yellow
    
    $buildGradlePath = "C:\Users\A\Desktop\bazaarew_app\android\app\build.gradle"
    $buildGradleContent = Get-Content $buildGradlePath -Raw
    
    # Signing config zaten var mı kontrol et
    if ($buildGradleContent -notlike "*keystoreProperties*") {
        # Dosyanın başına ekle
        $signingConfigCode = @'

def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

'@
        
        $buildGradleContent = $signingConfigCode + $buildGradleContent
        
        # signingConfigs bloğunu ekle
        $buildGradleContent = $buildGradleContent -replace '(?s)(android\s*\{)', @'
$1

    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
'@
        
        # buildTypes release'i güncelle
        $buildGradleContent = $buildGradleContent -replace '(?s)buildTypes\s*\{[^}]*release\s*\{[^}]*\}', @'
buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled false
            shrinkResources false
        }
    }
'@
        
        Set-Content -Path $buildGradlePath -Value $buildGradleContent
        
        Write-Host "✓ build.gradle güncellendi!" -ForegroundColor Green
    } else {
        Write-Host "✓ build.gradle zaten yapılandırılmış" -ForegroundColor Green
    }
    
    Write-Host ""
    Write-Host "==================================" -ForegroundColor Green
    Write-Host "✓ Tamamlandı!" -ForegroundColor Green
    Write-Host "==================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "ÖNEMLİ UYARILAR:" -ForegroundColor Red
    Write-Host "1. Keystore dosyasını güvenli bir yerde yedekleyin!" -ForegroundColor Yellow
    Write-Host "2. Şifrenizi unutmayın! (Kaydedin)" -ForegroundColor Yellow
    Write-Host "3. Bu dosyaları kimseyle paylaşmayın!" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Şimdi build_apk.ps1 scriptini çalıştırabilirsiniz." -ForegroundColor Cyan
    Write-Host ""
    
} else {
    Write-Host ""
    Write-Host "✗ Keystore oluşturulamadı!" -ForegroundColor Red
    Write-Host "Hata mesajlarını kontrol edin." -ForegroundColor Yellow
    exit 1
}







