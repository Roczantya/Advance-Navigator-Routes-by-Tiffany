# Advance Routes-Navigator App
  Aplikasi Flutter sederhana untuk navigasi antar layar dengan fitur UI kustom, termasuk bottom navigation bar, drawer, dan rute-rute yang mudah digunakan.

## Fitur
- `Bottom Navigation Bar` untuk navigasi antar layar (Home, Search, Settings dan Profile).
- `Drawer Menu` untuk navigasi tambahan, seperti Settings dan First Screen.
- Tombol AppBar untuk kembali ke layar sebelumnya.
- Tombol dinamis untuk berpindah antar layar.
  
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
     - Gunakan ikon di bagian bawah layar untuk berpindah antar layar: Home, Search, Settings dan Profile. dlam hal ini sebagai pengganti 
  3. Tombol Kembali di AppBar
     - Pada layar Third Screen, tombol ini akan membawa Anda kembali ke First Screen.


## Screenshot
  1. **Halaman Utama**
     
     ![halamanutama](https://github.com/Roczantya/Routes-Navigation-by-Tiffany-/blob/master/images/Screenshot%202024-12-05%20121931.png)
     
  2. **Bottom Navigation Bar**
          
     ![Menu](https://github.com/Roczantya/Routes-Navigation-by-Tiffany-/blob/master/images/Screenshot%202024-12-05%20121931.png)
     
  3. **Halaman Pertama**
      
     ![Halaman pertama](https://github.com/Roczantya/Routes-Navigation-by-Tiffany-/blob/master/images/Screenshot%202024-12-05%20121956.png)
     
  4. **Halaman Kedua**
     
     ![Halaman Kedua](https://github.com/Roczantya/Routes-Navigation-by-Tiffany-/blob/master/images/Screenshot%202024-12-05%20122014.png)
     
  5. **Halaman Ketiga**

     ![Halaman Ketiga](https://github.com/Roczantya/Routes-Navigation-by-Tiffany-/blob/master/images/Screenshot%202024-12-05%20122106.png)


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
