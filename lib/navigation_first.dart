import 'package:flutter/material.dart';
import 'navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = Colors.blue.shade700; // Warna awal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: Text('Navigation First Fachrio')),
      body: Center(
        child: ElevatedButton(
          child: Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context); // Navigasi ke layar kedua
          },
        ),
      ),
    );
  }

  Future _navigateAndGetColor(BuildContext context) async {
    color =
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NavigationSecond()),
        ) ??
        Colors.blue; // Mengubah warna berdasarkan pilihan
    setState(() {}); // Memperbarui tampilan
  }
}
