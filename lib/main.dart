import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fachrio Raditya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';

  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/ryBIEAAAQBAJ';

    final uri = Uri.https(authority, path);
    return http.get(uri);
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0; // Inisialisasi total
    total += await returnOneAsync(); // Menambahkan hasil dari returnOneAsync
    total += await returnTwoAsync(); // Menambahkan hasil dari returnTwoAsync
    total +=
        await returnThreeAsync(); // Menambahkan hasil dari returnThreeAsync
    setState(() {
      result = 'Total: $total'; // Memperbarui tampilan dengan total
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back From the Future Fachrio')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('Go!'),
              onPressed: () {
                count();
                setState(() {
                  result = 'Loading...'; // Mengubah status menjadi 'Loading...'
                });
                getData() // Memanggil fungsi untuk mengambil data
                    .then((value) {
                      result = value.body.toString().substring(
                        0,
                        450,
                      ); // Menampilkan 450 karakter pertama dari hasil
                      setState(() {}); // Memperbarui tampilan
                    })
                    .catchError((error) {
                      result =
                          'Error: $error'; // Menampilkan pesan kesalahan jika ada
                      setState(() {}); // Memperbarui tampilan
                    });
              },
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
