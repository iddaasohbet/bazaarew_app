# Flutter Otomatik Kurulum Scripti
# Yönetici olarak çalıştırın: PowerShell'i sağ tık > "Run as Administrator"

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Flutter Kurulum Başlıyor..." -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# 1. Flutter SDK İndirme
$flutterUrl = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.5-stable.zip"
$flutterZip = "$env:TEMP\flutter.zip"
$flutterPath = "C:\src\flutter"

Write-Host "[1/6] Flutter SDK indiriliyor... (Bu işlem birkaç dakika sürebilir)" -ForegroundColor Yellow

# İndirme
if (!(Test-Path $flutterZip)) {
    Invoke-WebRequest -Uri $flutterUrl -OutFile $flutterZip -UseBasicParsing
    Write-Host "✓ Flutter SDK indirildi" -ForegroundColor Green
} else {
    Write-Host "✓ Flutter SDK zaten indirilmiş" -ForegroundColor Green
}

Write-Host ""

# 2. Flutter'ı Çıkart
Write-Host "[2/6] Flutter SDK çıkartılıyor..." -ForegroundColor Yellow

if (!(Test-Path $flutterPath)) {
    # C:\src klasörünü oluştur
    New-Item -ItemType Directory -Path "C:\src" -Force | Out-Null
    
    # ZIP'i çıkart
    Expand-Archive -Path $flutterZip -DestinationPath "C:\src" -Force
    Write-Host "✓ Flutter SDK çıkartıldı: $flutterPath" -ForegroundColor Green
} else {
    Write-Host "✓ Flutter SDK zaten mevcut: $flutterPath" -ForegroundColor Green
}

Write-Host ""

# 3. PATH'e Ekle
Write-Host "[3/6] PATH ortam değişkenine ekleniyor..." -ForegroundColor Yellow

$flutterBin = "$flutterPath\bin"
$currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")

if ($currentPath -notlike "*$flutterBin*") {
    [Environment]::SetEnvironmentVariable(
        "Path",
        "$currentPath;$flutterBin",
        "Machine"
    )
    Write-Host "✓ Flutter PATH'e eklendi" -ForegroundColor Green
} else {
    Write-Host "✓ Flutter zaten PATH'te mevcut" -ForegroundColor Green
}

# Geçici PATH güncelleme (bu oturum için)
$env:Path = "$env:Path;$flutterBin"

Write-Host ""

# 4. Flutter Doctor
Write-Host "[4/6] Flutter kontrol ediliyor..." -ForegroundColor Yellow
Write-Host ""

& "$flutterBin\flutter.bat" doctor

Write-Host ""

# 5. Android Lisanslarını Kabul Et
Write-Host "[5/6] Android lisansları kabul ediliyor..." -ForegroundColor Yellow
Write-Host "Her soruya 'y' yazıp Enter'a basın..." -ForegroundColor Cyan
Write-Host ""

& "$flutterBin\flutter.bat" doctor --android-licenses

Write-Host ""

# 6. Proje Bağımlılıklarını Yükle
Write-Host "[6/6] Proje bağımlılıkları yükleniyor..." -ForegroundColor Yellow

$projectPath = Split-Path -Parent $PSScriptRoot

if ($projectPath -eq "") {
    $projectPath = "C:\Users\A\Desktop\bazaarew_app"
}

Set-Location $projectPath

& "$flutterBin\flutter.bat" pub get

Write-Host ""
Write-Host "==================================" -ForegroundColor Green
Write-Host "✓ Kurulum Tamamlandı!" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Green
Write-Host ""
Write-Host "Şimdi şunları yapabilirsiniz:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. PowerShell'i KAPAT ve YENİDEN AÇ (PATH güncellemesi için)" -ForegroundColor Yellow
Write-Host ""
Write-Host "2. APK oluşturmak için:" -ForegroundColor Yellow
Write-Host "   cd C:\Users\A\Desktop\bazaarew_app" -ForegroundColor White
Write-Host "   flutter build apk --release" -ForegroundColor White
Write-Host ""
Write-Host "3. App Bundle oluşturmak için (Google Play için önerilir):" -ForegroundColor Yellow
Write-Host "   flutter build appbundle --release" -ForegroundColor White
Write-Host ""
Write-Host "Not: İlk build 10-15 dakika sürebilir." -ForegroundColor Gray
Write-Host ""







