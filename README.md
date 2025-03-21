# Books

## Fachrio Raditya

Flutter Project Praktikum Pemrograman Asynchronous Semester 6

## Praktikum 1

- Soal 1

  ![1](./images/11.png)

- Soal 2
  ![1](./images/121.png)
  ![2](./images/122.png)

- Soal 3

Penjelasan Kode

Bagian dari aplikasi Flutter yang menggunakan tombol untuk memicu pengambilan data. Ketika tombol ditekan, status aplikasi diubah menjadi 'Loading...' dan fungsi `getData()` dipanggil. Setelah data berhasil diambil, hasilnya ditampilkan, tetapi hanya 450 karakter pertama. Jika terjadi kesalahan saat pengambilan data, pesan kesalahan akan ditampilkan.

![1](./images/13.png)

## Praktikum 2

- Soal 4

Penjelasan Kode

Mendefinisikan beberapa fungsi asinkron yang mengembalikan nilai setelah penundaan. Fungsi `count()` memanggil ketiga fungsi tersebut secara berurutan, menjumlahkan hasilnya, dan memperbarui status aplikasi dengan total yang dihitung.

![1](./images/24s.gif)

## Praktikum 3

- Soal 5

Penjelasan Kode

Menggunakan `Completer` untuk mengelola operasi asinkron. Fungsi `getNumber()` menginisialisasi `Completer` dan memanggil fungsi `calculate()`, yang akan menyelesaikan `Completer` setelah penundaan 5 detik dengan mengembalikan nilai 42.

![1](./images/35s.gif)

- Soal 6

Penjelasan Kode

Perbedaan calculate dengan calculate 2 hanya dilengkapi dengan penanganan kesalahan. Jika terjadi kesalahan selama penundaan, `Completer` akan diselesaikan dengan error.

Fungsi `getNumber()` memanggil salah satu dari fungsi di atas dan menangani hasilnya. Jika berhasil, hasilnya akan ditampilkan; jika terjadi kesalahan, pesan kesalahan akan ditampilkan.

![1](./images/36s.gif)
