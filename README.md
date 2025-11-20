# Bazaarew Android Uygulaması

Modern, profesyonel Flutter ile geliştirilmiş Android uygulaması. **WebView değil, gerçek native uygulama!**

## 📱 Özellikler

✅ **Kullanıcı Yönetimi**
- Kayıt olma (E-posta doğrulama ile)
- Giriş yapma
- Profil yönetimi
- Şifre sıfırlama

✅ **Ürün Yönetimi**
- Ürün listeleme
- Ürün detayları
- Ürün ekleme (Çoklu resim desteği)
- Ürün düzenleme
- Ürün silme
- Kategori filtreleme
- Şehir filtreleme
- Ürün arama

✅ **Mağaza Yönetimi**
- Mağaza oluşturma
- Mağaza bilgilerini güncelleme
- Mağaza profili

✅ **Mesajlaşma Sistemi**
- Kullanıcılar arası mesajlaşma
- Konuşma listesi
- Okunmamış mesaj sayısı

✅ **Modern UI/UX**
- Material Design 3
- Smooth animasyonlar
- Resim cache sistemi
- Pull-to-refresh
- Loading göstergeleri
- Error handling

✅ **Diğer**
- WhatsApp entegrasyonu
- Telefon arama
- Offline destek (cache)
- Push notification hazır

## 🚀 Kurulum

### 1. Flutter Kurulumu

Flutter'ı yükleyin: [Flutter Kurulum Rehberi](https://flutter.dev/docs/get-started/install)

```bash
# Flutter'ın doğru kurulduğunu kontrol edin
flutter doctor
```

### 2. Projeyi İndirin

Projeyi bilgisayarınıza indirin veya klonlayın.

### 3. Bağımlılıkları Yükleyin

```bash
cd bazaarew_app
flutter pub get
```

### 4. API Ayarları

`lib/services/api_config.dart` dosyasını açın ve kendi API URL'nizi girin:

```dart
static const String baseUrl = 'https://yourdomain.com/api';
static const String imageBaseUrl = 'https://yourdomain.com/images/';
```

### 5. Uygulamayı Çalıştırın

```bash
# Android emulator veya cihazda çalıştırma
flutter run

# Release modda çalıştırma (daha hızlı)
flutter run --release
```

## 📦 APK Oluşturma (Google Play için)

### Debug APK (Test için)

```bash
flutter build apk --debug
```

APK dosyası: `build/app/outputs/flutter-apk/app-debug.apk`

### Release APK (Yayın için)

```bash
flutter build apk --release
```

APK dosyası: `build/app/outputs/flutter-apk/app-release.apk`

### App Bundle (Google Play için önerilir)

```bash
flutter build appbundle --release
```

AAB dosyası: `build/app/outputs/bundle/release/app-release.aab`

> **Not:** Google Play'e yüklerken **App Bundle (.aab)** formatını kullanın. Daha küçük dosya boyutu ve otomatik optimizasyon sağlar.

## 🔐 Uygulama İmzalama (Önemli!)

Google Play'e yüklemek için uygulamanızı imzalamanız gerekir:

### 1. Keystore Oluşturun

```bash
keytool -genkey -v -keystore bazaarew-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias bazaarew
```

### 2. key.properties Dosyası Oluşturun

`android/key.properties` dosyası oluşturun:

```properties
storePassword=sizin_şifreniz
keyPassword=sizin_şifreniz
keyAlias=bazaarew
storeFile=../bazaarew-release-key.jks
```

### 3. build.gradle'ı Güncelleyin

`android/app/build.gradle` dosyasında signing config ekleyin:

```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    ...
    
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            shrinkResources true
        }
    }
}
```

### 4. İmzalı APK/AAB Oluşturun

```bash
flutter build appbundle --release
```

## 📱 Google Play'e Yükleme

1. [Google Play Console](https://play.google.com/console)'a gidin
2. "Create App" butonuna tıklayın
3. Uygulama bilgilerini doldurun
4. "Release" > "Production" > "Create new release"
5. AAB dosyasını yükleyin (`app-release.aab`)
6. Açıklamalarınızı yazın
7. "Review release" > "Start rollout to production"

## 🎨 Özelleştirme

### Uygulama Adını Değiştirme

1. `android/app/src/main/AndroidManifest.xml`:
```xml
<application android:label="Yeni İsim">
```

2. `pubspec.yaml`:
```yaml
name: yeni_isim
```

### Uygulama İkonunu Değiştirme

1. [App Icon Generator](https://appicon.co/) ile ikonlarınızı oluşturun
2. Oluşan dosyaları `android/app/src/main/res/` klasörlerine kopyalayın

### Renk Temasını Değiştirme

`lib/main.dart` dosyasında:

```dart
primaryColor: const Color(0xFF2196F3), // Mavi
// İstediğiniz renge değiştirin:
primaryColor: const Color(0xFFE91E63), // Pembe
```

## 📚 Teknolojiler

- **Flutter 3.x** - UI Framework
- **Dart 3.x** - Programlama Dili
- **Provider** - State Management
- **HTTP/Dio** - API İletişimi
- **Cached Network Image** - Resim Cache
- **Image Picker** - Resim Seçme
- **Shared Preferences** - Local Storage
- **URL Launcher** - Telefon/WhatsApp

## 🐛 Sorun Giderme

### "Flutter SDK not found"
```bash
# Flutter'ın PATH'e eklendiğinden emin olun
flutter doctor -v
```

### "Gradle build failed"
```bash
# Cache'i temizleyin
flutter clean
flutter pub get
```

### Emulator açılmıyor
```bash
# Mevcut emulator'leri listeleyin
flutter emulators

# Emulator başlatın
flutter emulators --launch <emulator_id>
```

## 📞 Destek

Herhangi bir sorun yaşarsanız:
- Issue açın
- Dokümantasyonu okuyun: [Flutter Docs](https://flutter.dev/docs)

## 📄 Lisans

© 2024 Bazaarew. Tüm hakları saklıdır.

---

## 🎯 Önemli Notlar

⚠️ **API URL'lerini mutlaka güncelleyin!**
⚠️ **Google Play'e yüklemeden önce uygulamayı imzalayın!**
⚠️ **Test için önce debug APK kullanın!**
⚠️ **Production'da App Bundle (.aab) kullanın!**

✅ **Bu gerçek bir Android uygulamasıdır - WebView değil!**
✅ **Native performans ve kullanıcı deneyimi**
✅ **Google Play standartlarına uygun**
✅ **Modern UI/UX**

---

**Başarılar! 🚀**







