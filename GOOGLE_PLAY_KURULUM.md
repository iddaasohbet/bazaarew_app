# Google Play'e Uygulama Yükleme Rehberi

## 📋 Gereksinimler

1. **Google Play Developer Hesabı**
   - Tek seferlik $25 ücret
   - [play.google.com/console](https://play.google.com/console) adresinden kayıt olun

2. **Hazır Materyaller**
   - İmzalanmış App Bundle (.aab)
   - Uygulama ikonu (512x512 PNG)
   - Feature graphic (1024x500 PNG)
   - Ekran görüntüleri (en az 2 adet)
   - Uygulama açıklaması
   - Gizlilik politikası URL'i

## 1️⃣ Uygulama Oluşturma

### Adım 1: Google Play Console'a Giriş

1. [play.google.com/console](https://play.google.com/console)
2. "Create app" butonuna tıklayın

### Adım 2: Temel Bilgiler

- **App name:** Bazaarew (veya tercih ettiğiniz isim)
- **Default language:** Turkish - Türkçe
- **App or game:** App
- **Free or paid:** Free
- **Declarations:** Tüm kutucukları işaretleyin
- "Create app" butonuna tıklayın

## 2️⃣ Mağaza Listeleme (Store Listing)

### Adım 1: App Details

**App name:** Bazaarew

**Short description (80 karakter):**
```
Alışveriş ve satış platformu. Ürün ekle, sat, güvenle alışveriş yap!
```

**Full description (4000 karakter):**
```
Bazaarew - Türkiye'nin Modern Alışveriş ve Satış Platformu

Bazaarew ile ikinci el ürünler alıp satabilir, yeni ürünler ekleyebilir ve güvenle alışveriş yapabilirsiniz.

🛍️ ÖZELLİKLER

✅ Kolay Ürün Ekleme
• Çoklu fotoğraf yükleme
• Kategori seçimi
• Şehir bazlı listeleme
• Anında yayınlama

✅ Akıllı Arama
• Kategori filtreleme
• Şehir filtreleme
• Hızlı arama sistemi

✅ Güvenli İletişim
• Satıcı ile mesajlaşma
• WhatsApp entegrasyonu
• Telefon ile iletişim

✅ Mağaza Yönetimi
• Kendi mağazanızı oluşturun
• Ürünlerinizi yönetin
• Satışlarınızı takip edin

✅ Kullanıcı Dostu Arayüz
• Modern ve şık tasarım
• Hızlı ve akıcı kullanım
• Kolay navigasyon

📱 KATEGORİLER

• Elektronik
• Moda ve Giyim
• Ev ve Yaşam
• Otomotiv
• Spor ve Outdoor
• Kitap ve Hobi
• Emlak
• İş Makineleri
• ve daha fazlası...

🔒 GÜVENLİK

• E-posta doğrulama sistemi
• Güvenli kullanıcı hesapları
• Şifreli iletişim

📞 DESTEK

Sorularınız için bize ulaşın:
E-posta: destek@bazaarew.com
Web: www.bazaarew.com

Hemen indirin ve alışverişe başlayın! 🚀
```

### Adım 2: Graphics

**App icon (512x512 PNG):**
- Logonuzun 512x512 boyutunda PNG versiyonu
- Arka plan şeffaf olmamalı

**Feature graphic (1024x500 PNG):**
- Uygulama tanıtım görseli
- [Canva](https://canva.com) ile oluşturabilirsiniz

**Phone screenshots (en az 2, en fazla 8):**
- Boyut: 1080x1920 veya 1080x2340
- Uygulamanın farklı ekranlarından görüntüler
- Ana sayfa, ürün listesi, ürün detayı, profil vb.

**Tablet screenshots (opsiyonel):**
- Boyut: 2048x2732

### Adım 3: Categorization

- **App category:** Shopping
- **Tags:** Alışveriş, İlan, Satış, İkinci El, E-ticaret

### Adım 4: Contact Details

- **Email:** destek@bazaarew.com (veya sizin e-postanız)
- **Phone (opsiyonel):** +90 XXX XXX XX XX
- **Website (opsiyonel):** https://bazaarew.com

### Adım 5: Privacy Policy

Gizlilik politikası URL'i zorunlu. Örnek:

```url
https://bazaarew.com/privacy-policy
```

Gizlilik politikanız yoksa [Privacy Policy Generator](https://www.privacypolicygenerator.info/) kullanın.

## 3️⃣ App Content (İçerik Beyanı)

### Privacy Policy
- Gizlilik politikası URL'inizi girin

### App Access
- "All functionality is available without special access"

### Ads
- Reklam gösteriyorsanız: Yes
- Göstermiyorsanız: No

### Content Ratings
1. "Start questionnaire"
2. Soruları cevaplayın (Bazaarew için):
   - Violence: No
   - Sexual content: No
   - Language: No
   - Drug use: No
   - Other objectionable content: No
3. "Submit"

### Target Audience
- **Age range:** 13+ (veya tercihiniz)
- "Save"

### News App
- "This is not a news app"

### COVID-19 Contact Tracing or Status Apps
- "This app is not related to COVID-19"

### Data Safety
1. "Start"
2. Sorular:
   - **Collects data?** Yes (E-posta, isim, telefon topluyorsunuz)
   - **Shares data?** No
   - **Data encrypted?** Yes
   - **Delete data?** Yes, users can request deletion
3. Data types:
   - Personal info: Name, Email, Phone
   - Photos and videos: Product images
   - Location: City (approximate location)
4. "Submit"

### Government Apps
- "This is not a government app"

## 4️⃣ App Bundle Yükleme

### Adım 1: Production Track

1. Sol menüden "Release" > "Production"
2. "Create new release"

### Adım 2: App Bundle Yükleme

1. "Upload" butonuna tıklayın
2. `app-release.aab` dosyasını seçin
3. Yükleme tamamlanana kadar bekleyin

### Adım 3: Release Notes

**Version name:** 1.0.0

**Release notes (Türkçe):**
```
İlk sürüm - Bazaarew resmi olarak yayında!

✨ Özellikler:
• Kullanıcı kayıt ve giriş sistemi
• Ürün ekleme ve listeleme
• Kategori ve şehir filtreleme
• Ürün arama
• Mağaza oluşturma ve yönetimi
• Satıcı ile iletişim
• WhatsApp entegrasyonu
• Modern ve kullanıcı dostu arayüz

Uygulamayı indirdiğiniz için teşekkürler!
```

### Adım 4: Review

1. "Review release"
2. Tüm bilgileri kontrol edin
3. "Start rollout to Production"

## 5️⃣ Son Kontroller

Google Play tarafından incelenecek alanlar:

✅ **Store Listing:**
- Tüm alanlar dolduruldu mu?
- Ekran görüntüleri yüklendi mi?
- Açıklamalar anlamlı mı?

✅ **App Content:**
- Gizlilik politikası var mı?
- İçerik derecelendirmesi yapıldı mı?
- Veri güvenliği beyanı dolduruldu mu?

✅ **App Releases:**
- App Bundle yüklendi mi?
- Release notes yazıldı mı?

✅ **Pricing & Distribution:**
- Ülkeler seçildi mi?
- Fiyatlandırma ayarlandı mı?

## 6️⃣ Pricing & Distribution

### Countries
- **Available in:** Tüm ülkeler veya sadece Türkiye
- "Add countries" > "Turkey" seçin

### Pricing
- **Paid or Free:** Free

### Declarations
- ✅ This application complies with US export laws
- ✅ This application does not contain ads (veya gösteriyorsanız işaretlemeyin)
- ✅ I acknowledge that my app meets Android's Target API level requirements

"Save"

## 7️⃣ Yayınlama

### Adım 1: Final Review

1. Dashboard'da tüm bölümleri kontrol edin
2. Yeşil tik işaretleri olmalı

### Adım 2: Publish

1. Sağ üstteki "Send for review" butonuna tıklayın
2. Google'ın incelemesini bekleyin

### İnceleme Süresi

- **Genellikle:** 24-48 saat
- **Bazen:** 1 hafta
- **İlk uygulama:** Daha uzun sürebilir

## 8️⃣ İnceleme Sonrası

### Onaylandı ✅

Tebrikler! Uygulamanız Play Store'da yayında.

**Yapılacaklar:**
- Uygulamayı test edin
- Kullanıcı yorumlarını takip edin
- Güncellemeleri planlayın

### Reddedildi ❌

Google neden reddettiğini bildirir.

**Sık Reddedilme Nedenleri:**
1. Gizlilik politikası eksik/yanlış
2. Ekran görüntüleri uygunsuz
3. Açıklamada yanıltıcı bilgi
4. Telif hakkı ihlali
5. Çöken/çalışmayan özellikler

**Çözüm:**
1. Sorunu düzeltin
2. Yeni App Bundle yükleyin
3. Tekrar gönderin

## 🔄 Güncelleme Yayınlama

### Adım 1: Versiyon Güncellemesi

`android/app/build.gradle`:
```gradle
defaultConfig {
    versionCode 2  // Her güncellemede artırın
    versionName "1.0.1"  // Versiyon numarası
}
```

### Adım 2: Build

```bash
flutter build appbundle --release
```

### Adım 3: Upload

1. Production > "Create new release"
2. Yeni App Bundle yükleyin
3. Release notes yazın
4. "Review release" > "Start rollout"

## 📊 Analitik ve Takip

### Google Play Console Dashboard

- **Yüklemeler:** Günlük/haftalık/aylık
- **Kullanıcı değerlendirmeleri:** Yıldız ve yorumlar
- **Çökme raporları:** Hata takibi
- **ANR raporları:** Yanıt vermeyen uygulama
- **Pre-launch raporu:** Google'ın otomatik testleri

### Önemli Metrikler

- **Install rate:** Yükleme oranı
- **Uninstall rate:** Kaldırma oranı
- **Retention rate:** Kullanıcı tutma oranı
- **Ratings:** Ortalama puan

## ⚠️ Önemli Uyarılar

1. **Keystore'u saklayın** - Kaybederseniz güncelleme yapamazsınız!
2. **Package name değişmez** - İlk yüklemeden sonra asla değiştirilemez
3. **Google Play politikalarını okuyun** - [policies](https://play.google.com/about/developer-content-policy/)
4. **Kullanıcı gizliliğine saygı** - GDPR/KVKK uyumlu olun
5. **Copyright'a dikkat** - Telif hakkı ihlali ciddi sorunlar doğurur

## 📱 App Store (iOS) için

Eğer iOS versiyonu da yapacaksanız:

1. **Apple Developer Program** - $99/yıl
2. **Xcode** gerekli (sadece Mac'te çalışır)
3. **Provisioning profiles** ve sertifikalar

```bash
flutter build ios --release
```

Detaylı iOS rehberi için Apple dokümantasyonuna bakın.

## 🎯 Başarı İpuçları

1. **Ekran görüntülerini özenle seçin** - İlk izlenim önemli
2. **Açıklamayı SEO dostu yazın** - Anahtar kelimeler ekleyin
3. **Güncellemeleri düzenli yapın** - Google aktif uygulamaları sever
4. **Yorumlara yanıt verin** - Kullanıcı memnuniyeti
5. **Beta testleri yapın** - Closed/Open Beta Track kullanın
6. **Analitik takip edin** - Firebase Analytics ekleyin

## 📞 Destek Kaynakları

- [Google Play Console Help](https://support.google.com/googleplay/android-developer)
- [Flutter Deployment Guide](https://flutter.dev/docs/deployment/android)
- [Android Developer](https://developer.android.com/)

---

**Başarılar! Uygulamanız milyonlarca kullanıcıya ulaşsın! 🚀**







