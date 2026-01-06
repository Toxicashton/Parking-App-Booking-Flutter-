

---

# 🚗 Smart Parking Booking App

A Flutter-based mobile application that allows users to check parking slot availability in real-time and book spots for specific dates. This project demonstrates clean architecture, efficient state management using `Provider`, and dynamic UI updates.

*(Tip: Once you upload screenshots to GitHub, replace this link with an actual image of your app!)*

## ✨ Features

* **Interactive Grid View:** Visual representation of parking spots.
* 🟢 **Green Tile:** Spot is available.
* 🔴 **Red Tile:** Spot is currently booked.


* **Smart Booking System:**
* Tap on any green spot to start a booking.
* Prevents interaction with already booked (red) spots.


* **Date Range Selection:** Users can select specific "From" and "To" dates using a built-in calendar interface.
* **Intelligent State Management:**
* Spots automatically update their color based on the selected dates.
* Uses a centralized service (`ParkingService`) to manage data across screens.



## 📱 Screenshots



## 🛠️ Tech Stack

* **Framework:** [Flutter](https://flutter.dev/) (Dart)
* **State Management:** [Provider](https://pub.dev/packages/provider) package
* **Utilities:** [Intl](https://pub.dev/packages/intl) package (for date formatting)
* **IDE:** VS Code / Android Studio

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
* An Android Emulator or physical device connected.

### Installation

1. **Clone the repository:**
```bash
git clone https://github.com/Toxicashton/parking-booking-app.git

```


2. **Navigate to the project folder:**
```bash
cd parking-booking-app

```


3. **Install dependencies:**
```bash
flutter pub get

```


4. **Run the app:**
```bash
flutter run

```



## 📂 Project Structure

The project follows a scalable folder structure:

```
lib/
├── models/
│   ├── booking.dart       # Data model for booking details (spot ID + dates)
│   └── parking_spot.dart  # Data model for individual parking spots
├── screens/
│   ├── booking_screen.dart # UI for selecting dates and confirming bookings
│   └── home_screen.dart    # Main dashboard showing the parking grid
├── services/
│   └── parking_service.dart # The "Brain" (Provider) handling logic and state
├── widgets/
│   └── parking_spot_tile.dart # Reusable custom widget for the parking slots
└── main.dart              # App entry point and Provider setup

```

## 🔮 Future Improvements

* **Persistence:** detailed integration of `shared_preferences` to save bookings after the app closes.
* **Time Slots:** Adding hourly booking capabilities.
* **User Accounts:** Authenticaton for multiple users.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.



---

