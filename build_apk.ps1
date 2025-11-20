# APK Build Scripti
# Flutter kurulumu yapıldıktan sonra bu scripti çalıştırın

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Bazaar Watan APK Oluşturuluyor..." -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

$projectPath = "C:\Users\A\Desktop\bazaarew_app"
Set-Location $projectPath

# Flutter kontrol
$flutterCmd = Get-Command flutter -ErrorAction SilentlyContinue

if (!$flutterCmd) {
    Write-Host "HATA: Flutter bulunamadı!" -ForegroundColor Red
    Write-Host "Lütfen önce 'flutter_kurulum.ps1' scriptini çalıştırın." -ForegroundColor Yellow
    Write-Host "Veya PowerShell'i kapatıp yeniden açın." -ForegroundColor Yellow
    exit 1
}

Write-Host "✓ Flutter bulundu: $($flutterCmd.Source)" -ForegroundColor Green
Write-Host ""

# Clean
Write-Host "[1/4] Önceki build dosyaları temizleniyor..." -ForegroundColor Yellow
flutter clean
Write-Host "✓ Temizlendi" -ForegroundColor Green
Write-Host ""

# Pub Get
Write-Host "[2/4] Bağımlılıklar yükleniyor..." -ForegroundColor Yellow
flutter pub get
Write-Host "✓ Bağımlılıklar yüklendi" -ForegroundColor Green
Write-Host ""

# Build APK
Write-Host "[3/4] Release APK oluşturuluyor..." -ForegroundColor Yellow
Write-Host "Bu işlem 10-15 dakika sürebilir, lütfen bekleyin..." -ForegroundColor Cyan
Write-Host ""

flutter build apk --release

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✓ APK oluşturuldu!" -ForegroundColor Green
    Write-Host ""
    Write-Host "APK Konumu:" -ForegroundColor Cyan
    Write-Host "$projectPath\build\app\outputs\flutter-apk\app-release.apk" -ForegroundColor White
    Write-Host ""
    
    # Dosya boyutunu göster
    $apkPath = "$projectPath\build\app\outputs\flutter-apk\app-release.apk"
    if (Test-Path $apkPath) {
        $apkSize = [math]::Round((Get-Item $apkPath).Length / 1MB, 2)
        Write-Host "Dosya Boyutu: $apkSize MB" -ForegroundColor Cyan
    }
    
    Write-Host ""
    Write-Host "Bu APK'yı test için telefona yükleyebilirsiniz." -ForegroundColor Yellow
    Write-Host ""
    
} else {
    Write-Host ""
    Write-Host "✗ Build başarısız!" -ForegroundColor Red
    Write-Host "Hata mesajlarını yukarıda kontrol edin." -ForegroundColor Yellow
    exit 1
}

# [4/4] App Bundle sor
Write-Host "[4/4] App Bundle da oluşturulsun mu? (Google Play için önerilir)" -ForegroundColor Yellow
Write-Host "App Bundle oluşturmak için 'E' tuşuna basın, atlamak için başka bir tuşa basın..." -ForegroundColor Cyan
$response = Read-Host

if ($response -eq 'E' -or $response -eq 'e') {
    Write-Host ""
    Write-Host "App Bundle oluşturuluyor..." -ForegroundColor Yellow
    Write-Host ""
    
    flutter build appbundle --release
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✓ App Bundle oluşturuldu!" -ForegroundColor Green
        Write-Host ""
        Write-Host "AAB Konumu:" -ForegroundColor Cyan
        Write-Host "$projectPath\build\app\outputs\bundle\release\app-release.aab" -ForegroundColor White
        Write-Host ""
        
        # Dosya boyutunu göster
        $aabPath = "$projectPath\build\app\outputs\bundle\release\app-release.aab"
        if (Test-Path $aabPath) {
            $aabSize = [math]::Round((Get-Item $aabPath).Length / 1MB, 2)
            Write-Host "Dosya Boyutu: $aabSize MB" -ForegroundColor Cyan
        }
        
        Write-Host ""
        Write-Host "Bu AAB dosyasını Google Play Console'a yükleyin." -ForegroundColor Yellow
        Write-Host ""
    }
}

Write-Host ""
Write-Host "==================================" -ForegroundColor Green
Write-Host "✓ Tamamlandı!" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Green
Write-Host ""
Write-Host "Sonraki Adımlar:" -ForegroundColor Cyan
Write-Host "1. APK'yı test için telefona yükleyin" -ForegroundColor White
Write-Host "2. App Bundle'ı Google Play Console'a yükleyin" -ForegroundColor White
Write-Host "3. GOOGLE_PLAY_KURULUM.md dosyasını okuyun" -ForegroundColor White
Write-Host ""







