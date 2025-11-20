# 📱 BAZAAR WATAN - GOOGLE PLAY YÜKLEME REHBERİ

## 🚀 HIZLI BAŞLANGIÇ

### Adım 1: Keystore Oluştur
```bash
# Projenin kök dizininde çalıştır:
create_keystore.bat
```

**ÖNEMLİ:** Şu bilgileri girin:
- **Şifre (keystore password):** bazaarew2024
- **Alias şifresi:** bazaarew2024
- **İsim:** Bazaar Watan
- **Organizasyon:** Bazaar Watan
- **Şehir:** Kabul
- **Ülke:** AF

⚠️ **BU BİLGİLERİ KAYDET!** Bu anahtarı kaybederseniz uygulamayı güncelleyemezsiniz!

---

### Adım 2: APK Oluştur
```bash
# Tek tıkla APK oluştur:
BUILD_APK.bat
```

Bu işlem:
- ✅ Flutter temizler
- ✅ Bağımlılıkları yükler
- ✅ Release APK oluşturur
- ✅ APK'ları masaüstüne kopyalar

**Süre:** ~5-10 dakika

---

### Adım 3: APK'yı Test Et

Oluşturulan APK'lar:
- `app-armeabi-v7a-release.apk` (32-bit Android)
- `app-arm64-v8a-release.apk` (64-bit Android) ⭐ **ÖNEMLİ**
- `app-x86_64-release.apk` (Emulator)

**Test için:**
1. `app-arm64-v8a-release.apk`'yı telefonunuza atın
2. Yükleyin ve test edin

---

## 📦 GOOGLE PLAY CONSOLE'A YÜKLEME

### 1. Google Play Console'a Giriş
https://play.google.com/console

### 2. Yeni Uygulama Oluştur
- **Uygulama Adı:** Bazaar Watan - بازار وطن
- **Dil:** Farsça (Dari)
- **Kategori:** Alışveriş
- **Uygulama Türü:** Uygulama

### 3. Uygulama Detayları

#### Kısa Açıklama (80 karakter)
```
خرید و فروش آسان در بازار وطن - آگهی رایگان، محصولات متنوع
```

#### Tam Açıklama (4000 karakter)
```
🛍️ بازار وطن - بهترین پلتفرم خرید و فروش افغانستان

بازار وطن یک پلتفرم آنلاین جامع برای خرید و فروش محصولات مختلف در افغانستان است.

✨ ویژگی های برنامه:

📱 رابط کاربری ساده و زیبا
🔍 جستجوی پیشرفته محصولات
🏪 ایجاد فروشگاه شخصی
📸 آپلود تصاویر با کیفیت بالا
💬 سیستم پیام رسانی مستقیم
🔔 اعلان های فوری
⭐ امکان نظردهی و رتبه بندی
🔒 امنیت کامل اطلاعات

📂 دسته بندی های متنوع:
- وسایل نقلیه
- املاک و مستغلات
- الکترونیکی و کامپیوتر
- خانه و آشپزخانه
- پوشاک و لباس
- حیوانات و مواشی
- استخدام و کاریابی
- خدمات

🎯 چرا بازار وطن؟
✓ ثبت آگهی رایگان
✓ دسترسی آسان به هزاران محصول
✓ پشتیبانی 24/7
✓ امکانات پیشرفته فروش
✓ محیط امن و مطمئن

📞 تماس با ما:
Website: https://bazaarewatan.com
Email: info@bazaarewatan.com

همین حالا بازار وطن را دانلود کنید و خرید و فروش آسان را تجربه کنید! 🌟
```

### 4. Screenshot'lar (Gerekli)

**Boyutlar:**
- Telefon: 1080 x 1920 px (minimum)
- Tablet: 1920 x 1080 px (opsiyonel)

**Sayı:**
- Minimum: 2 screenshot
- Maksimum: 8 screenshot

### 5. App Icon

Mevcut icon'lar:
- `android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png` (192x192)

### 6. Feature Graphic

**Boyut:** 1024 x 500 px

---

## 🔐 İMZALAMA BİLGİLERİ

Keystore Detayları:
```
Dosya: android/app/bazaarew-release-key.jks
Alias: bazaarew-key-alias
Keystore Password: bazaarew2024
Key Password: bazaarew2024
```

---

## 📋 GOOGLE PLAY GEREKSİNİMLERİ

### ✅ Kontrol Listesi:
- [x] APK 64-bit desteği (arm64-v8a) ✅
- [x] Target API Level 34 ✅
- [x] Privacy Policy URL gerekli
- [x] App signing by Google Play
- [ ] Içerik derecelendirmesi (uygulamayı yüklerken yapılacak)
- [ ] Reklam içeriği bildirimi
- [ ] Hedef yaş grubu

### Privacy Policy URL:
```
https://bazaarewatan.com/privacy-policy.html
```

---

## 🎯 SON ADIMLAR

1. ✅ `create_keystore.bat` çalıştır
2. ✅ `BUILD_APK.bat` çalıştır
3. ✅ APK'yı test et
4. 📤 Google Play Console'a yükle
5. ✏️ Uygulama bilgilerini doldur
6. 📸 Screenshot'ları yükle
7. 🚀 İncelemeye gönder

---

## ⚠️ ÖNEMLİ NOTLAR

1. **Keystore'u kaybet!** - Bu anahtarı kaybederseniz uygulamayı güncelleyemezsiniz
2. **İlk onay 1-7 gün sürebilir**
3. **Privacy Policy sayfası zorunlu**
4. **Target API Level her yıl güncellenir**

---

## 🆘 SORUN GİDERME

### APK build hatası:
```bash
flutter clean
flutter pub get
flutter build apk --release
```

### Keystore hatası:
- Şifreleri kontrol edin (bazaarew2024)
- build.gradle'daki yolu kontrol edin

### Signing hatası:
- Keystore dosyasının doğru yerde olduğundan emin olun
- `android/app/bazaarew-release-key.jks`

---

## 📞 DESTEK

Sorun yaşarsanız:
- Website: https://bazaarewatan.com
- Email: info@bazaarewatan.com

---

**Başarılar! 🎉**



