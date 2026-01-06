import 'package:flutter/material.dart';
import 'package:parkingapp/screens/booking_screen.dart';
import '../models/parking_spot.dart';

class ParkingSpotTile extends StatelessWidget {
  final ParkingSpot parkingSpot;
  // 1. ADD THIS NEW PROPERTY
  final bool isCurrentlyBooked;

  const ParkingSpotTile({
    super.key,
    required this.parkingSpot,
    // 2. ADD THIS TO THE CONSTRUCTOR
    required this.isCurrentlyBooked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // 3. UPDATE THE 'onTap' LOGIC
      onTap: () {
        // Use the new property to check if the spot is available
        if (!isCurrentlyBooked) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookingScreen(spotId: parkingSpot.id),
            ),
          );
        }
      },
      child: Container(
        // 4. UPDATE THE DECORATION LOGIC
        // The color is now based on 'isCurrentlyBooked',
        // not 'parkingSpot.isBooked'
        decoration: BoxDecoration(
          color: isCurrentlyBooked
              ? const Color.fromARGB(255, 250, 40, 40)   // Red if booked
              : const Color.fromARGB(255, 40, 234, 47), // Green if available
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isCurrentlyBooked
                ? const Color.fromARGB(255, 245, 38, 35)
                : const Color.fromARGB(255, 45, 239, 55),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            parkingSpot.id,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}