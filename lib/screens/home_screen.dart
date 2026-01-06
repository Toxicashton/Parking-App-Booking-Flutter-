import 'package:flutter/material.dart';
import 'package:parkingapp/services/parking_service.dart';
//import 'package:flutter/cupertino.dart';
// ignore: unused_import
import '../models/parking_spot.dart'; // Import the model
import '../widgets/parking_spot_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking App'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Consumer<ParkingService>(
        builder: (context, parkingService, child) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // How many columns you want
              crossAxisSpacing: 10, // Horizontal space between items
              mainAxisSpacing: 10, // Vertical space between items
              childAspectRatio:
                  1.5, // The ratio of width to height for each item
            ),
            itemCount: parkingService.parkingSpots.length,

              // lib/screens/home_screen.dart - INSIDE THE GridView.builder

              itemBuilder: (BuildContext context, int index) {
                final spot = parkingService.parkingSpots[index];

                // 1. Get the current booking status from the service
                final bool isBookedNow = parkingService.isSpotCurrentlyBooked(spot.id);

                // 2. Pass BOTH properties to the tile ✅
                return ParkingSpotTile(
                  parkingSpot: spot,
                  isCurrentlyBooked: isBookedNow, // This line fixes the error
                );
              },
          );
        },
      ),
    );
  }
}
