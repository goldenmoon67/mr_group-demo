# Deeplink Demo: Express (API) & Flutter (Mobil)

Bu proje, backend için **Express.js** ve mobil frontend için **Flutter** kullanılarak geliştirilmiş bir full-stack uygulamadır. Aşağıdaki adımları takip ederek projeyi kurabilir ve çalıştırabilirsiniz.

---

## Gereksinimler (Requirements)

### Genel Gereksinimler
- [Git](https://git-scm.com/) bilgisayarınıza kurulu olmalıdır.
- [Visual Studio Code](https://code.visualstudio.com/) veya benzer bir metin editörü önerilir.

### Backend (API) Gereksinimleri
- [Node.js (v16 veya üstü)](https://nodejs.org/) kurulu olmalıdır.
- [npm](https://www.npmjs.com/) veya [yarn](https://yarnpkg.com/) kurulu olmalıdır.

### Frontend (Mobil) Gereksinimleri
- [Flutter SDK](https://docs.flutter.dev/get-started/install) kurulu olmalıdır. (  sdk: ^3.5.4)
- [Dart SDK](https://dart.dev/get-dart) (Flutter ile birlikte gelir).
- Test için bir mobil cihaz ya da emülatör ayarlayın:
  - Android: [Android Studio](https://developer.android.com/studio).
  - iOS (sadece macOS): [Xcode](https://developer.apple.com/xcode/).

---

## Proje Yapısı

```javascript
├── README.md
├── api/          # Backend (Express.js)
└── mobile/       # Frontend (Flutter)
```

---
---

## API Docs
Backend API ile ilgili detaylı dokümantasyona aşağıdaki bağlantıdan ulaşabilirsiniz:

[Backend API Dokümantasyonu](https://telegra.ph/Deeplink-Demo-app-for-MR-Group-12-12)

Bu dokümantasyonda, tüm endpoint'lerin açıklamaları, giriş parametreleri, yanıt yapıları ve örnek kullanım senaryoları bulunmaktadır. Daha fazla bilgi için bağlantıya göz atabilirsiniz.


---
## Ortam Değişkenleri (Environment Setup)
Uygulamayı çalıştırabilmek için gerekli olan .env dosyalarını geliştiricinizden almayı unutmayınız. Bu dosyalar, API anahtarları ve diğer ortam değişkenlerini içerir ve uygulamanın düzgün bir şekilde çalışması için gereklidir.

### API `.env` Dosyası
Geliştiriciden aldığınız  `.backend_env` dosyasını `api/` dizinine taşıyınız ve adını `.env` olarak güncelleyiniz.


### Mobil `.env` Dosyası
Geliştiriciden aldığınız  `.mobile_env` dosyasını `mobile/` dizinine taşıyınız ve adını `.env` olarak güncelleyiniz.

! Important !
Mobil Env dosyası içinde yer alan BASE_URL_IOS ayarını kendi IP adresinize güncellemeniz gerekmetedir. Aksi halde IOS'da test yapmanız olası değil.

```env
BASE_URL_IOS=http://{Your-IP-Address}:5000/api
```

---

## Kurulum Adımları

### Backend (API)

1. `api/` klasörüne gidin:
   ```bash
   cd api
   ```

2. Gerekli bağımlılıkları yükleyin:
   ```bash
   npm install
   ```

3. Geliştirme sunucusunu başlatın:
   ```bash
   npm run dev
   ```
   API varsayılan olarak `http://localhost:5000` adresinde çalışacaktır.


---

### Frontend (Mobil)

1. `mobile/` klasörüne gidin:
   ```bash
   cd mobile
   ```

2. Gerekli bağımlılıkları yükleyin:
   ```bash
   flutter pub get
   ```
3. Emulator Başlatın:
Flutter projelerinde emülatörleri komut satırından başlatmak için aşağıdaki adımları izleyebilirsiniz.

A.Tüm Mevcut Emülatörleri Listeleme

   ```bash
  flutter emulators
   ```
B.Bir Emülatörü Başlatma
  ```bash
flutter emulators --launch <emulator_id>
   ```
   Komut çalıştırıldığında cihazınızı veya emülatörünüzü seçin.

3. Uygulamayı başlatın:
   ```bash
   flutter run
   ```
   Komut çalıştırıldığında cihazınızı veya emülatörünüzü seçin.

---
# Uygulamanın Test Edilmesi

Bu bölümde uygulamanın işlevlerinin nasıl test edileceği adım adım anlatılacaktır. Test sırasında uygulamanın **Express.js API'si** çalışır durumda olmalı ve mobil uygulama başlatılmış olmalıdır.

---
Aşağıdaki linkte deeplink kullanımının test edildiği senaryoda bir video görebilirsiniz
 ```bash
   https://drive.google.com/file/d/1YnjY-89LUkCn7kXW8gbrjWf6C7pHJHCh/view?usp=drive_link
   ```

## Test İşlemleri

### 1. Giriş (Login) ve Kayıt (Register)
1. Uygulama açıldığında **Login** ve **Register** ekranlarını göreceksiniz.
2. Test için kullanılabilecek bir kullanıcı hesabı:
   - **E-posta:** testuser@example.com
   - **Şifre:** 123456

3. Eğer giriş yapmak yerine yeni bir kullanıcı kaydı oluşturmak isterseniz, "Register" ekranından yeni bir hesap oluşturabilirsiniz.

---

### 2. Uygulama İçeriği
Giriş yaptıktan sonra aşağıdaki bilgiler görüntülenebilir:
- **Referral Link:** Kullanıcının kendi referans linki.
- **Kuponlar:** Kullanıcının sahip olduğu kuponlar.
- **Bakiye:** Kullanıcının mevcut bakiyesi.
- **Ürünler:** Kullanılabilir ürünler.

### 3. Ürün Satın Alma
- Kullanıcının bakiyesi yeterliyse, ürünleri satın alabilir. 
- Ürün satın alındığında, bakiye buna göre güncellenir.

---

### 4. Referral Link Kullanımı ve Deeplink Testi
1. Kullanıcı kendi **Referral Linkini** kopyalar. Örnek link:
https://miracaltinay.com/deeplink?referralId={your-referral-id}


2. Referral linki başka bir kullanıcıya gönderilir (örneğin, bir arkadaşınıza veya başka bir cihaza).

3. Yeni bir kullanıcı, bu referral linki ile kayıt olmak için linke tıklar uygulamayı açar. Debug ortamında çalıştığımız için emulatorler de linki sağlamadığı için 
- Android cihazda şu komut kullanılır:
  ```bash
  adb shell am start -a android.intent.action.VIEW -d "https://miracaltinay.com/deeplink?referralId={your-referral-id}"
  ```
- Bu komut çalıştırıldığında uygulama açılır ve kayıt ekranı görüntülenir.

4. Yeni kullanıcı, kayıt ekranını doldurur ve hesap oluşturur.
5. Daha sonra bu yeni kullanıcı uygulamaya giriş yapar.

---

### 5. Referans İşlemi ve Kupon Kazanımı
1. Yeni kullanıcı, ilk ürün alımını gerçekleştirdiğinde, referans linkini paylaşan kullanıcıya 500 TL değerinde bir kupon tanımlanır.

2. İlk kullanıcının hesabına giriş yapılır. 
- Bu kullanıcı, hesabında yeni eklenen kuponu görebilir.

---

### 6. Kupon Kullanımı
1. Kupon, "Kupon Kullan" ekranında görülebilir.
2. Kullanıcı kuponu kullandığında, kupon yalnızca "kullanıldı" olarak işaretlenir (şu an için bu işlem kuponu basitçe kullanılabilir hale getirmek için yapılmıştır. Bakiyeye ekleme, ürün satın alırken indirim sağlama gibi farklı yollarla bu kupon kolayca kullanılaiblir).

---

## Özet
- Kullanıcılar referral linklerini paylaşarak yeni kullanıcılar kazanabilir.
- Yeni kullanıcıların ilk alışverişi, referral sahibi için kupon kazandırır.
- Kuponlar kullanılabilir ve sistem bu işlemleri doğru bir şekilde izler.

Test sürecinde herhangi bir sorun yaşarsanız, uygulamanın loglarını kontrol edin veya API'nin çalışır durumda olduğundan emin olun.

## Faydalı Bağlantılar

- [Node.js Kurulum Rehberi](https://nodejs.org/en/download/)
- [Flutter Kurulum Rehberi](https://docs.flutter.dev/get-started/install)
- [Çevre Değişkenleri Hakkında](https://12factor.net/config)

---

## Sorun Giderme

1. **Node.js ile İlgili Sorunlar**:
   - Doğru Node.js sürümünü yüklediğinizden emin olun.
   - API'nin kullandığı portta bir çakışma olmadığından emin olun.

2. **Fluttser ile İlgili Sorunlar**:
   - `flutter doctor` komutunu çalıştırarak kurulumun eksiksiz olduğundan emin olun.
   - Emülatörünüzün veya fiziksel cihazınızın düzgün çalıştığından emin olun.

3. **Çevre Değişkenleri**:
   - `.env` dosyalarının doğru dizinlerde olduğundan ve doğru değerler içerdiğinden emin olun.

---

