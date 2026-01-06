import 'package:flutter/material.dart';
import '../models/booking.dart';
import '../models/parking_spot.dart';


class ParkingService with ChangeNotifier {
  // Your list of spots (this doesn't change)
  final List<ParkingSpot> _parkingSpots = [
  ParkingSpot(id: 'P1'),
  ParkingSpot(id: 'P2'),
  ParkingSpot(id: 'P3'),
  ParkingSpot(id: 'P4'),
  ParkingSpot(id: 'P5'),
  ParkingSpot(id: 'P6'),
  ParkingSpot(id: 'P7'),
  ParkingSpot(id: 'P8'), // ... and so on
  ];

  // This holds all bookings
  final List<Booking> _bookings = [];

  List<ParkingSpot> get parkingSpots => _parkingSpots;

  // --- MODIFIED METHOD ---
  // It now accepts a 'userName' instead of a date range
  void bookSpot(String spotId, String userName) {
    _bookings.add(Booking(
      spotId: spotId,
      userName: userName,
      bookingDate: DateTime.now(), // Stores the booking for *right now*
    ));

    notifyListeners();
  }


  // This logic now checks if a spot was booked *today*
  bool isSpotCurrentlyBooked(String spotId) {
    final now = DateTime.now();

    // Check if any booking matches the spotId AND was made on the same day
    return _bookings.any((booking) {
      return booking.spotId == spotId &&
          DateUtils.isSameDay(booking.bookingDate, now);
    });
  }
}
