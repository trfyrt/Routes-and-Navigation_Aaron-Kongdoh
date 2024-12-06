# Routes & Navigation Codelabs

Project ini merupakan pengembangan lanjutan dari codelab **navigation_codelab**. Dalam project ini, dipelajari konsep routing dan navigasi, termasuk cara berpindah antar halaman menggunakan tombol pada halaman Flutter maupun bottom navigation bar di bagian bawah halaman.

## Advanced Navigation

Dalam pengembangan ini, telah ditambahkan:

- Satu halaman tambahan untuk memperluas fungsionalitas aplikasi.
- Penamaan routing untuk mempermudah pengelolaan navigasi antar halaman.
- Bottom navigation bar untuk mempermudah navigasi pengguna.

## Cara Install dan Pakai

### Prasyarat
- Flutter SDK sudah terinstal di komputer Anda.
- Editor kode seperti Android Studio atau Visual Studio Code.

### Langkah-langkah Instalasi
1. Clone repositori ini ke komputer Anda:
   ```bash
   git clone https://github.com/trfyrt/Routes-and-Navigation_Aaron-Kongdoh.git
   ```
   
2. Navigasikan ke direktori proyek:
   ```bash
   cd navigation_codelab
   ```
   
3. Jalankan perintah berikut untuk menginstal dependensi:
   ```bash
   flutter pub get
   ```
   

### Cara Menjalankan Aplikasi
1. Buka terminal
2. Navigasikan ke direktori proyek Anda
3. Jalankan aplikasi dengan perintah berikut:
   ```bash
   flutter run
   ```

## Fitur
### Screens
- **First Screen**: Terdapat Title yang bertuliskan First Screen serta tombol yang berfungsi untuk berpindah ke halaman `Second Screen`
- **Second Screen**: Terdapat Title yang bertuliskan Second Screen serta tombol yang berfungsi untuk berpindah ke halaman `Third Screen`
- **Third Screen**: Terdapat Title yang bertuliskan Third Screen serta tombol yang berfungsi untuk berpindah kembali ke halaman `First Screen`

### Named Routing
- `/`: Route untuk ke halaman pertama, `First Screen`
- `/second`: Route untuk ke halaman kedua, `Second Screen`
- `/third`: Route untuk ke halaman ketiga, `Third Screen`

## Tantangan dan Pendekatan
### Tantangan
Dalam lab activity kali ini, saya menghadapi beberapa kendala, salah satunya adalah membuat halaman berpindah sesuai keinginan tanpa menumpuk. Awalnya, saya hanya mengenal mekanisme `push` dan `pop`. Untuk mengatasi hal ini, saya menggunakan metode `pushNamedAndRemoveUntil` dengan argumen `(route) => false`, sehingga halaman tidak menumpuk di stack.

Selain itu, saya juga mengalami kesulitan dalam membuat navigation bar, yang membutuhkan pemahaman lebih mendalam. Untuk mengatasi masalah ini, saya membaca dokumentasi dan mempelajarinya lebih lanjut dengan bertanya kepada ChatGPT. Saya menyimpan nama-nama route yang telah diinisialisasi sebelumnya ke dalam sebuah list bernama `routes`, lalu memanggil route yang diinginkan menggunakan index, seperti pada contoh berikut: `routes[index]`.

### Pendekatan
Dalam mengerjakan lab activity ini, saya menggunakan kode yang telah diberikan di E-learn untuk membuat halaman pertama dan kedua. Setelah itu saya mulai membuat halaman ketiga dengan mengcopy isi kode halaman kedua tetapi mengganti title dan route tombolnya.

Selanjutnya saya mulai mengerjakan advanced routing yang merupakan syarat pengumpulan, yaitu membuat penamaan routing pada halaman `main.dart` dengan mengandalkan dokumentasi dari [Flutter Navigation](https://docs.flutter.dev/ui/navigation). Selanjutnya saya membuat navigation bar yang terdapat pada bawah halaman dengan menggunakan widget `NavigationBar` yang terdapat pada library `material.dart` dengan mengandalkan dokumentasi pada https://api.flutter.dev/flutter/material/NavigationBar-class.html
