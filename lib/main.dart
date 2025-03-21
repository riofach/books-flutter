import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'geolocation.dart';

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
      // home: const FuturePage(),
      home: const LocationScreen(), //praktikum 6
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

  late Completer completer; // Mendeklarasikan Completer

  Future getNumber() {
    completer = Completer<int>(); // Menginisialisasi Completer
    calculate2(); // Memanggil fungsi calculate
    return completer.future; // Mengembalikan future dari Completer
  }

  // Future calculate() async {
  //   await Future.delayed(const Duration(seconds: 5)); // Menunggu selama 5 detik
  //   completer.complete(42); // Menyelesaikan Completer dengan nilai 42
  // }

  Future calculate2() async {
    try {
      await new Future.delayed(
        const Duration(seconds: 5), // Menunggu selama 5 detik
      );
      completer.complete(42); // Menyelesaikan Completer dengan nilai 42
    } catch (e) {
      completer.completeError(e); // Menyelesaikan Completer dengan error
    }
  }

  void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
  }

  // late Future<List<int>> futures;
  // @override
  // void initState() {
  //   super.initState();
  //   futures = Future.wait<int>([
  //     returnOneAsync(),
  //     returnTwoAsync(),
  //     returnThreeAsync(),
  //   ]);
  // } //praktikum 4

  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Error');
  } //praktikum 5

  Future handleError() async {
    try {
      await returnError();
    } catch (e) {
      setState(() {
        result = e.toString();
      });
    } finally {
      print('Completed');
    }
  } //praktikum 5

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
                setState(() {
                  result = 'Loading...'; // Mengubah status menjadi 'Loading...'
                });

                // getData() // Memanggil fungsi untuk mengambil data
                //     .then((value) {
                //       result = value.body.toString().substring(
                //         0,
                //         450,
                //       ); // Menampilkan 450 karakter pertama dari hasil
                //       setState(() {}); // Memperbarui tampilan
                //     })
                //     .catchError((error) {
                //       result =
                //           'Error: $error'; // Menampilkan pesan kesalahan jika ada
                //       setState(() {}); // Memperbarui tampilan
                //     }); // praktikum 1

                // count(); //praktikum 2

                // getNumber()
                //     .then((value) {
                //       setState(() {
                //         result = value.toString();
                //       });
                //     })
                //     .catchError((error) {
                //       setState(() {
                //         result = 'Error: $error';
                //       });
                //     }); //praktikum 3

                // returnFG(); //praktikum 4

                // returnError()
                //     .then((value) {
                //       setState(() {
                //         result = 'Success';
                //       });
                //     })
                //     .catchError((error) {
                //       setState(() {
                //         result = error.toString();
                //       });
                //     })
                //     .whenComplete(() => print('Completed')); //praktikum 5
                // handleError(); //praktikum 5
              },
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            // const CircularProgressIndicator(),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
