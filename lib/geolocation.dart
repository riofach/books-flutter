import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';
  // @override
  // void initState() {
  //   super.initState();
  //   getPosition().then((Position myPos) {
  //     myPosition =
  //         'Lat: ${myPos.latitude.toString()}, Long: ${myPos.longitude.toString()}';
  //     setState(() {
  //       myPosition = myPosition;
  //     });
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   final myWidget =
  //       myPosition == '' ? const CircularProgressIndicator() : Text(myPosition);

  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Current Location Fachrio')),
  //     body: Center(child: myWidget),
  //   );
  // }

  Future<Position> getPosition() async {
    // await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3));
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  Future<Position>? position;
  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location Fachrio')),
      body: Center(
        child: FutureBuilder(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text(snapshot.data.toString());
            } else {
              return const Text('No data');
            }
          },
        ),
      ),
    );
  }
}
