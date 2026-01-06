import 'package:flutter/material.dart';
import 'package:parkingapp/screens/home_screen.dart'; // Import the home screen
import 'package:parkingapp/services/parking_service.dart';
import 'package:provider/provider.dart';

void main() {
  // The main entry point for the app
  runApp(
    ChangeNotifierProvider(
      create: (context) => ParkingService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hides the debug banner in the top-right corner
      debugShowCheckedModeBanner: false,

      title: 'Parking App',

      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // The first screen
      home: HomeScreen(),
    );
  }
}
