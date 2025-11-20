# Bazaarew Android Uygulaması - Kurulum Rehberi

## 📋 Gereksinimler

- Windows 10/11
- En az 8GB RAM
- 20GB boş disk alanı
- İnternet bağlantısı

## 1️⃣ Flutter Kurulumu

### Adım 1: Flutter SDK İndir

1. [Flutter SDK İndirme Sayfası](https://flutter.dev/docs/get-started/install/windows)
2. "flutter_windows_x.x.x-stable.zip" dosyasını indirin
3. `C:\src\flutter` klasörüne çıkartın

### Adım 2: PATH'e Ekle

1. Windows Arama'da "env" yazın
2. "Sistem ortam değişkenlerini düzenle" seçeneğine tıklayın
3. "Ortam Değişkenleri" butonuna tıklayın
4. "Path" değişkenini seçin ve "Düzenle"ye tıklayın
5. "Yeni" butonuna tıklayın
6. `C:\src\flutter\bin` yazın
7. "Tamam"a tıklayın

### Adım 3: Kurulumu Kontrol Et

PowerShell veya CMD açın:

```bash
flutter doctor
```

Çıktıda şunları göreceksiniz:
```
[✓] Flutter
[✗] Android toolchain
[✗] Chrome
[✗] Visual Studio
[✗] Android Studio
```

## 2️⃣ Android Studio Kurulumu

### Adım 1: İndir ve Kur

1. [Android Studio İndirme](https://developer.android.com/studio)
2. İndirilen dosyayı çalıştırın
3. "Next" > "Next" > "Install" diyerek kurulumu tamamlayın

### Adım 2: Android SDK Kur

1. Android Studio'yu açın
2. "More Actions" > "SDK Manager"
3. "Android SDK" sekmesinde:
   - ✅ Android SDK Command-line Tools
   - ✅ Android SDK Platform-Tools
   - ✅ Android SDK Build-Tools
4. "Apply" > "OK"

### Adım 3: Flutter Plugin Kur

1. Android Studio'da "Plugins"
2. "Flutter" arayın ve "Install"
3. Dart da otomatik yüklenecek
4. Android Studio'yu yeniden başlatın

### Adım 4: Android Lisanslarını Kabul Et

```bash
flutter doctor --android-licenses
```

Her soruya `y` yazıp Enter'a basın.

## 3️⃣ Emulator Oluşturma

### Yöntem 1: Android Studio İle

1. Android Studio'yu açın
2. "More Actions" > "Virtual Device Manager"
3. "Create Device"
4. "Phone" > "Pixel 5" seçin > "Next"
5. "S" (API 31) seçin > "Next"
6. "Finish"

### Yöntem 2: Komut Satırıyla

```bash
# Emulator listesini göster
flutter emulators

# Emulator oluştur (Android Studio'da yapıldıysa gerek yok)
flutter emulators --create

# Emulator başlat
flutter emulators --launch <emulator_id>
```

## 4️⃣ Projeyi Çalıştırma

### Adım 1: Proje Klasörüne Git

```bash
cd C:\Users\A\Desktop\bazaarew_app
```

### Adım 2: Bağımlılıkları Yükle

```bash
flutter pub get
```

### Adım 3: API Ayarlarını Yap

`lib/services/api_config.dart` dosyasını açın:

```dart
static const String baseUrl = 'https://yourdomain.com/api';
```

**Değiştirin:**
```dart
static const String baseUrl = 'https://bazaarew.com/api';  // Kendi domain'iniz
```

### Adım 4: Emulator'u Başlat

```bash
flutter emulators --launch <emulator_id>
```

Veya Android Studio'da AVD Manager'dan başlatın.

### Adım 5: Uygulamayı Çalıştır

```bash
flutter run
```

İlk çalıştırma 5-10 dakika sürebilir.

## 5️⃣ APK Oluşturma

### Debug APK (Test için)

```bash
flutter build apk --debug
```

**APK yolu:** `build\app\outputs\flutter-apk\app-debug.apk`

Bu APK'yı telefona yükleyip test edebilirsiniz.

### Release APK (Yayın için)

```bash
flutter build apk --release
```

**APK yolu:** `build\app\outputs\flutter-apk\app-release.apk`

## 6️⃣ Google Play'e Yükleme İçin App Bundle

### App Bundle Oluştur

```bash
flutter build appbundle --release
```

**AAB yolu:** `build\app\outputs\bundle\release\app-release.aab`

### Google Play Console

1. [play.google.com/console](https://play.google.com/console) adresine gidin
2. Yeni uygulama oluşturun
3. App Bundle'ı yükleyin
4. Mağaza listelemesini doldurun (başlık, açıklama, ekran görüntüleri)
5. Yayına alın

## 🔐 Uygulama İmzalama (ÖNEMLİ!)

Google Play'e yüklemek için uygulamanızı imzalamanız gerekir.

### Adım 1: Java JDK Kur

Flutter ile birlikte gelir, ancak yoksa:

```bash
# JDK kontrolü
java -version
```

### Adım 2: Keystore Oluştur

```bash
cd C:\Users\A\Desktop\bazaarew_app\android

keytool -genkey -v -keystore bazaarew-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias bazaarew
```

Sorular:
- **Şifre:** Güçlü bir şifre girin (ÖNEMLİ: Unutmayın!)
- **İsim:** Şirket/Kişi adınız
- **Organizasyon:** Şirket adı
- **Şehir, Eyalet, Ülke:** Bilgileriniz

### Adım 3: key.properties Oluştur

`android/key.properties` dosyası oluşturun:

```properties
storePassword=sizin_güçlü_şifreniz
keyPassword=sizin_güçlü_şifreniz
keyAlias=bazaarew
storeFile=bazaarew-key.jks
```

⚠️ **key.properties ve .jks dosyalarını GİZLİ tutun!**
⚠️ **Git'e EKLEMEYIN!**

### Adım 4: build.gradle Güncelle

`android/app/build.gradle` dosyasını açın ve **android { }** bloğundan önce ekleyin:

```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}
```

**android { }** bloğu içine ekleyin:

```gradle
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
            minifyEnabled false
            shrinkResources false
        }
    }
```

### Adım 5: İmzalı Build Oluştur

```bash
flutter clean
flutter build appbundle --release
```

Artık Google Play'e yükleyebilirsiniz!

## 🎨 Özelleştirmeler

### Uygulama Adını Değiştir

**1. AndroidManifest.xml** (`android/app/src/main/AndroidManifest.xml`):

```xml
<application
    android:label="Yeni Uygulama Adı">
```

**2. pubspec.yaml**:

```yaml
name: yeni_uygulama_adi
```

### Uygulama İkonunu Değiştir

1. [AppIcon.co](https://appicon.co/) sitesine gidin
2. İkonunuzu yükleyin (1024x1024 PNG)
3. Android seçin ve indir
4. İndirilen dosyaları:
   - `android/app/src/main/res/` klasörüne kopyalayın

### Splash Screen Rengini Değiştir

`android/app/src/main/res/values/colors.xml`:

```xml
<color name="splash_color">#2196F3</color>  <!-- Mavi -->
```

İstediğiniz renkle değiştirin:

```xml
<color name="splash_color">#E91E63</color>  <!-- Pembe -->
```

## ❗ Sık Karşılaşılan Sorunlar

### "Flutter SDK not found"

```bash
# PATH kontrolü
where flutter

# Çıktı olmalı: C:\src\flutter\bin\flutter.bat
```

Yoksa PATH'e tekrar ekleyin.

### "Unable to locate Android SDK"

```bash
flutter config --android-sdk C:\Users\KULLANICI_ADI\AppData\Local\Android\Sdk
```

### "Gradle build failed"

```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

### APK yüklenmiyor

1. Telefonda "Bilinmeyen kaynaklardan yükleme" açık olmalı
2. Settings > Security > Unknown sources > Enable

### Emulator yavaş

1. Android Studio > AVD Manager > Edit (kalem ikonu)
2. "Graphics" > "Hardware"
3. RAM: 2048 MB yapın

## 📱 Fiziksel Cihazda Test

### Android Telefon

1. Telefonda "Geliştirici Seçenekleri"ni açın:
   - Ayarlar > Telefon Hakkında
   - "Yapı numarası"na 7 kez dokunun
2. Geliştirici Seçenekleri > USB Hata Ayıklama: Açık
3. USB ile bağlayın
4. Telefondan izin verin

```bash
# Cihaz kontrolü
flutter devices

# Uygulamayı çalıştır
flutter run
```

## 🎓 Öğrenme Kaynakları

- [Flutter Dokümantasyon](https://flutter.dev/docs)
- [Dart Öğren](https://dart.dev/guides)
- [Flutter YouTube](https://www.youtube.com/c/flutterdev)

## 💡 İpuçları

1. **İlk çalıştırma uzun sürer** - Normal, sabırlı olun
2. **Hot Reload kullanın** - Kod değişikliklerinde `r` tuşuna basın
3. **Debug modu yavaş** - Release modda test edin
4. **Google Play'e .aab yükleyin** - .apk değil
5. **Keystore'u yedekleyin** - Kaybederseniz güncelleme yapamazsınız!

## ✅ Checklist

Google Play'e yüklemeden önce:

- [ ] API URL'leri güncellendi
- [ ] Uygulama adı değiştirildi
- [ ] Uygulama ikonu değiştirildi
- [ ] Splash screen özelleştirildi
- [ ] Keystore oluşturuldu
- [ ] İmzalı App Bundle oluşturuldu
- [ ] Gerçek cihazda test edildi
- [ ] Ekran görüntüleri alındı
- [ ] Gizlilik politikası hazırlandı

---

**Başarılar! 🚀**

Sorularınız için: [Flutter Türkiye Topluluğu](https://flutter-tr.dev/)







