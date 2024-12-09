# Advance Routes-Navigator App
  Aplikasi Flutter sederhana untuk navigasi antar layar dengan fitur UI kustom, termasuk bottom navigation bar, dan rute-rute yang mudah digunakan.

## Fitur
- `Bottom Navigation Bar` untuk navigasi antar layar (Home, Generated screen).
- Tombol AppBar untuk kembali ke layar sebelumnya.
- Tombol dinamis untuk berpindah antar layar.
- Screen Biodata guna menampilkan biodata sang pembuat
- Button mengucapkan ulang tahun 
  
## Persyaratan
Sebelum memulai, pastikan Anda telah memenuhi persyaratan berikut:
  1. Install Flutter (disarankan versi 3.x atau lebih baru).
  2. Pastikan lingkungan Flutter Anda sudah siap:
     - Jalankan `flutter doctor` di terminal untuk memastikan semua komponen telah terinstal dengan benar.

## Instalasi
1. Clone repositori ini ke komputer Anda:
  ```bash
  git clone https://github.com/Roczantya/Routes-Navigation-by-Tiffany-.git
  cd Routes-Navigation-by-Tiffany
  ```
2. Instal semua dependensi yang diperlukan:
  ```bash
  flutter pub get
  ```
3. Jalankan aplikasi:
  ```bash
  flutter run
  ```

## Penggunaan
  ### Navigasi
  1. __Home Screen__
     - Layar default saat aplikasi dibuka.
     - Terdapat tombol untuk menuju First Screen atau membuka dialog.
  2. Bottom Navigation Bar
     - Gunakan ikon di bagian bawah layar untuk berpindah antar layar: Home, Generated Screen. dalam hal ini sebagai pengganti 
  3. Tombol Kembali di AppBar
     - Pada layar Third Screen, tombol ini akan membawa Anda kembali ke First Screen.
  4. __Biodata Screen__
     - Berisi tentang Biodata saya pembuaaat dan ada tombol button untuk mengucapkan selama ulang tahun
  5. __Generated Screen__
      - Berisi halaman in[ut box yang mana jika diisi dengan angka maka akan mengenerate haaman sebanyak yang diinput
     
## Challenge (Tantangan)
  - Pembuatan route screen terutama pada `BiodataScreen` yang memerlukan *pass argument*
  - Pada bagian `GeneratedScreen` yang memerlukan inputan dan mengenerated screen sebanyak yang dimau

## Approach (Pendekatan)
  - Untuk case pertama, saya `onGenerateRoute` untuk pengunaan logika lebih dinamis. Adanya if disini digunakan untuk menghandle nama rute. Penggunaan `if` ini bisa penggunaan pass argument ke layar lain
  - Pendekatan yang dilakukan adalah awalnya langsung bisa next ke halaman berikunya namun da bermasalah karena tidak dapa mengenerate halaman sebelum dari angka diinput. Namun saya menggnakan list view guna membuat list screen dari 1 sampai ke angka inpu box

## Struktur Folder
  Struktur folder aplikasi mengikuti format standar Flutter:

```plaintext
lib/
├── main.dart           # Titik masuk aplikasi dan widget pada bottom navigasi bar
├── first_screen.dart   # Logika dan UI layar pertama
├── second_screen.dart  # Logika dan UI layar kedua
├── third_screen.dart   # Logika dan UI layar ketiga
```

## Lisensi
  Proyek ini dilisensikan di bawah Lisensi MIT. Lihat file LICENSE untuk detail lebih lanjut.
