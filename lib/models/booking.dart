class Booking {
  final String spotId;
  final String userName;
  final DateTime bookingDate; // The date the booking was made

  Booking({
    required this.spotId,
    required this.userName,
    required this.bookingDate,
  });
}