import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  Color? color; // Menyimpan warna yang dipilih
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navigation Second Fachrio')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Red'),
              onPressed: () {
                color = Colors.red.shade700; // Memilih warna merah
                Navigator.pop(
                  context,
                  color,
                ); // Mengembalikan warna ke layar pertama
              },
            ),
            ElevatedButton(
              child: Text('Yellow'),
              onPressed: () {
                color = Colors.yellow.shade700; // Memilih warna kuning
                Navigator.pop(
                  context,
                  color,
                ); // Mengembalikan warna ke layar pertama
              },
            ),
            ElevatedButton(
              child: Text('Green'),
              onPressed: () {
                color = Colors.green.shade700; // Memilih warna hijau
                Navigator.pop(
                  context,
                  color,
                ); // Mengembalikan warna ke layar pertama
              },
            ),
          ],
        ),
      ),
    );
  }
}
