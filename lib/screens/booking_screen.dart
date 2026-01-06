import 'package:flutter/material.dart';
import 'package:parkingapp/services/parking_service.dart';
import 'package:provider/provider.dart';
// Remove the 'intl' import if you're not using it here anymore

class BookingScreen extends StatefulWidget {
  final String spotId;

  const BookingScreen({
    super.key,
    required this.spotId,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // Controller to get text from the name field
  final _nameController = TextEditingController();

  // Variable to check if the name field is empty
  bool _isNameEmpty = true;

  @override
  void initState() {
    super.initState();
    // Listen to the controller to enable/disable the confirm button
    _nameController.addListener(() {
      setState(() {
        _isNameEmpty = _nameController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Spot: ${widget.spotId}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Book for: Today Only',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 24),

            // --- NEW WIDGET: TEXT FIELD FOR NAME ---
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
                icon: Icon(Icons.person),
              ),
              autofocus: true, // Automatically opens the keyboard
            ),
            const SizedBox(height: 16),

            // --- UPDATED BUTTON LOGIC ---
            FilledButton(
              // Button is disabled if the name is empty
              onPressed: _isNameEmpty
                  ? null
                  : () {
                // Get the name from the controller
                final userName = _nameController.text;

                final parkingService =
                Provider.of<ParkingService>(context, listen: false);

                // Pass the spotId and the new userName
                parkingService.bookSpot(widget.spotId, userName);

                Navigator.pop(context);
              },
              child: const Text('Confirm Booking'),
            ),
          ],
        ),
      ),
    );
  }
}