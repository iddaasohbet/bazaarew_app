# 🚀 Bazaar Watan Android Uygulaması - Hızlı Başlangıç

## ✅ Yapılan İşlemler

Tüm konfigürasyon tamamlandı:

1. ✅ **Domain Güncellendi:** https://bazaarewatan.com/
2. ✅ **Uygulama Adı:** بازار وطن (Bazaar Watan)
3. ✅ **Paket Adı:** com.bazaarewatan.app
4. ✅ **API Endpoints:** Tüm API'ler bazaarewatan.com'a bağlandı
5. ✅ **Android Konfigürasyonu:** Tamamlandı

## 📋 Gereken Tek Şey: Flutter Kurulumu

Uygulamayı build almak için Flutter gerekiyor. İşte adım adım:

---

## 🎯 Seçenek 1: Otomatik Kurulum (ÖNERİLİR)

### Adım 1: PowerShell'i Yönetici Olarak Aç

1. Windows'ta **PowerShell** ara
2. Sağ tık > **"Run as Administrator"**
3. Şu komutu çalıştır:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
```

### Adım 2: Kurulum Scriptini Çalıştır

```powershell
cd C:\Users\A\Desktop\bazaarew_app
.\flutter_kurulum.ps1
```

Bu script:
- ✅ Flutter SDK indirir (~900MB)
- ✅ Otomatik kurulum yapar
- ✅ PATH'e ekler
- ✅ Android lisanslarını kabul eder
- ✅ Proje bağımlılıklarını yükler

**Süre:** ~15-20 dakika (internet hızınıza bağlı)

### Adım 3: PowerShell'i Kapat ve Yeniden Aç

PATH güncellemesi için gerekli.

### Adım 4: Keystore Oluştur (Google Play için zorunlu)

```powershell
cd C:\Users\A\Desktop\bazaarew_app
.\keystore_olustur.ps1
```

**Önemli:** Girdiğiniz şifreyi unutmayın!

### Adım 5: APK/AAB Oluştur

```powershell
cd C:\Users\A\Desktop\bazaarew_app
.\build_apk.ps1
```

Bu script:
- ✅ Release APK oluşturur (test için)
- ✅ App Bundle oluşturur (Google Play için)

**Süre:** İlk build ~15 dakika, sonrakiler ~2-3 dakika

---

## 🎯 Seçenek 2: Manuel Kurulum

### 1. Flutter İndir ve Kur

```powershell
# 1. Flutter indir
Invoke-WebRequest -Uri "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.5-stable.zip" -OutFile "$env:TEMP\flutter.zip"

# 2. C:\src klasörüne çıkart
Expand-Archive -Path "$env:TEMP\flutter.zip" -DestinationPath "C:\src" -Force
```

### 2. PATH'e Ekle

1. Windows Arama: **"env"** yaz
2. **"Sistem ortam değişkenlerini düzenle"**
3. **"Ortam Değişkenleri"** > **"Path"** > **"Düzenle"**
4. **"Yeni"** > `C:\src\flutter\bin` ekle
5. **"Tamam"** > PowerShell'i kapat ve yeniden aç

### 3. Flutter Kontrol

```powershell
flutter doctor
```

### 4. Android Lisanslarını Kabul Et

```powershell
flutter doctor --android-licenses
```

Her soruya **y** yazıp Enter.

### 5. Bağımlılıkları Yükle

```powershell
cd C:\Users\A\Desktop\bazaarew_app
flutter pub get
```

### 6. Build Al

**Test APK:**
```powershell
flutter build apk --release
```

**Google Play AAB:**
```powershell
flutter build appbundle --release
```

---

## 📁 Dosya Konumları

Build sonrası dosyaları burada bulacaksınız:

**APK (Test için):**
```
C:\Users\A\Desktop\bazaarew_app\build\app\outputs\flutter-apk\app-release.apk
```

**AAB (Google Play için):**
```
C:\Users\A\Desktop\bazaarew_app\build\app\outputs\bundle\release\app-release.aab
```

---

## 🔐 Keystore Oluşturma (Önemli!)

Google Play'e yüklemek için uygulamanızı **imzalamanız** gerekir.

### Otomatik:

```powershell
.\keystore_olustur.ps1
```

### Manuel:

```powershell
cd android

keytool -genkey -v -keystore bazaarewatan-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias bazaarewatan
```

**Sorulan bilgileri doldurun:**
- Şifre (unutmayın!)
- İsim, organizasyon, şehir, ülke

Sonra `android/key.properties` dosyası oluşturun:

```properties
storePassword=sizin_şifreniz
keyPassword=sizin_şifreniz
keyAlias=bazaarewatan
storeFile=bazaarewatan-key.jks
```

---

## 📱 Google Play'e Yükleme

1. [Google Play Console](https://play.google.com/console) aç
2. **"Create app"** tıkla
3. Uygulama bilgilerini doldur
4. **"Release" > "Production" > "Create new release"**
5. **app-release.aab** dosyasını yükle
6. Release notes yaz ve yayınla

**Detaylı rehber:** `GOOGLE_PLAY_KURULUM.md` dosyasını okuyun.

---

## ❓ Sorun mu Yaşıyorsun?

### Flutter bulunamadı
```powershell
# PATH'e doğru eklenmiş mi kontrol et
where.exe flutter

# Yoksa PowerShell'i kapat ve yeniden aç
```

### Build hatası
```powershell
# Temizle ve tekrar dene
flutter clean
flutter pub get
flutter build apk --release
```

### Gradle hatası
```powershell
cd android
.\gradlew clean
cd ..
flutter clean
flutter pub get
```

---

## 📚 Önemli Dosyalar

| Dosya | Açıklama |
|-------|----------|
| `flutter_kurulum.ps1` | Otomatik Flutter kurulumu |
| `keystore_olustur.ps1` | Keystore oluşturma (imzalama için) |
| `build_apk.ps1` | APK/AAB build scripti |
| `KURULUM_TR.md` | Detaylı kurulum rehberi |
| `GOOGLE_PLAY_KURULUM.md` | Google Play yükleme rehberi |
| `README.md` | Genel dokümantasyon |

---

## ⚡ Hızlı Komutlar

```powershell
# Her şeyi otomatik yap
Set-ExecutionPolicy Bypass -Scope Process -Force
cd C:\Users\A\Desktop\bazaarew_app
.\flutter_kurulum.ps1
# PowerShell'i kapat ve yeniden aç
.\keystore_olustur.ps1
.\build_apk.ps1
```

---

## ✅ Checklist

Sırayla yapın:

- [ ] Flutter kurulumu yapıldı
- [ ] PowerShell kapatıp yeniden açıldı
- [ ] `flutter doctor` çalıştı
- [ ] Android lisansları kabul edildi
- [ ] Keystore oluşturuldu
- [ ] APK build alındı
- [ ] APK test edildi (telefona yükleyip)
- [ ] App Bundle oluşturuldu
- [ ] Google Play Console hesabı açıldı
- [ ] App Bundle yüklendi

---

## 🎯 Özet

1. **flutter_kurulum.ps1** çalıştır → PowerShell yeniden aç
2. **keystore_olustur.ps1** çalıştır
3. **build_apk.ps1** çalıştır
4. **app-release.aab** dosyasını Google Play'e yükle

**Bu kadar! 🚀**

---

## 📞 Destek

Sorun yaşarsan:
- `KURULUM_TR.md` dosyasını oku
- [Flutter Dokümantasyon](https://flutter.dev/docs)
- [Google Play Help](https://support.google.com/googleplay/android-developer)

---

**Başarılar! Uygulanız milyonlara ulaşsın! 🎉**







