# Resident | Society Management App

Welcome to the **Resident | Society Management App**! This Flutter-based app is designed to streamline society management by enabling easy communication, bill payments, notices, and more for residents of gated communities or apartment complexes.

## Features

- **Resident Login**: Secure login system for authenticated residents.
- **Prepaid Meter Management**: View, manage, and recharge prepaid meters with a user-friendly interface.
- **SOS Feature**: Quickly send SOS alerts in emergencies.
- **Help Desk**: Submit service requests and communicate with management.
- **Notice Board**: Stay updated with the latest community announcements.
- **Local Directory**: Access a directory of local services such as plumbers, electricians, and more.
- **Amenities Booking**: Reserve community amenities like the gym, pool, or clubhouse.

## Screenshots

![Login Page](https://raw.githubusercontent.com/Sakshi-2508/Resident/refs/heads/master/screenshot/1.png)
![OTP Page](https://raw.githubusercontent.com/Sakshi-2508/Resident/refs/heads/master/screenshot/2.png)
![Profile Page](https://raw.githubusercontent.com/Sakshi-2508/Resident/refs/heads/master/screenshot/3.png)
![Community Page](https://raw.githubusercontent.com/Sakshi-2508/Resident/refs/heads/master/screenshot/4.png)
![Society Dues](https://raw.githubusercontent.com/Sakshi-2508/Resident/refs/heads/master/screenshot/5.png)
![Prepaid Meter](https://raw.githubusercontent.com/Sakshi-2508/Resident/refs/heads/master/screenshot/6.png)


## Installation

To run the project locally, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Sakshi-2508/Resident.git
   cd resident-society-management-app
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

Make sure you have Flutter installed. If not, follow the instructions at the [official Flutter website](https://flutter.dev/docs/get-started/install).

## Folder Structure

The main files in the project are organized as follows:

```
lib/
|- screens/
|  |- login_screen.dart       # Login page for residents
|  |- prepaid_meter.dart      # Prepaid meter management
|  |- sos_page.dart           # SOS feature UI
|  |- help_desk.dart          # Help Desk UI
|  |- notice_board.dart       # Notice Board UI
|  |- local_directory.dart    # Local Directory page
|  |- amenities_page.dart     # Amenities Booking UI
|- models/                    # Data models for various components
|- services/                  # API services and data handling
```

## Technologies Used

- **Flutter**: For building the cross-platform UI.
- **Dart**: Flutter’s programming language.
- **Firebase** (optional): For backend services, authentication, and database.

## Contributions

Contributions are welcome! Feel free to submit a pull request or open an issue if you encounter any bugs or have suggestions for new features.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.