# 🌱 Green — Carbon Footprint Calculator

> **Build Green. Build Smart.**

Green is a Flutter-based mobile application designed to help construction stakeholders calculate and understand the carbon footprint of their projects.

The application estimates emissions from **construction materials, energy consumption, transportation, and construction operations**, giving users an overall project carbon footprint.

---

## 🎯 Objective

The goal of Green is to make carbon accounting simple and accessible for the construction sector.

The application follows a simple approach:

**Measure → Understand → Improve**

Users can measure their project's carbon footprint and, in future versions, receive recommendations to reduce emissions.

---

## ✨ Features

- 🌿 Sustainability-focused onboarding
- 👤 Role selection for different users
- 🔐 Firebase email/password authentication
- 🏠 User dashboard
- 🧮 Construction carbon-footprint calculator
- 🧱 Material emission calculation
- ⚡ Energy emission calculation
- 🚛 Transportation emission calculation
- 🏗️ Construction operation emissions
- 📊 Carbon-footprint summary
- ☁️ Cloud storage of calculations using Firebase Firestore

---

## 🧮 Carbon Footprint Calculator

The calculator is divided into four major categories.

### 🧱 Materials

Users can select construction materials and enter their quantity to estimate material-related emissions.

### ⚡ Energy

Users can enter electricity and fuel consumption to calculate energy-related emissions.

### 🚛 Transportation

Transportation emissions are calculated using factors such as:

- Vehicle type
- Transportation distance
- Material weight

### 🏗️ Construction Operations

The application also considers energy consumed during construction operations.

### Total Carbon Footprint

The final result is calculated by combining emissions from all four categories:

**Total Carbon Footprint = Materials + Energy + Transportation + Operations**

The result is displayed in **kg CO₂**.

---

## 🏗️ Architecture

Green follows a simple layered architecture that separates the user interface, application logic, and data management.

### Presentation Layer

Responsible for the application's user interface and user interaction.

It includes:

- Onboarding screens
- Login and Sign-up
- Role selection
- Dashboard
- Carbon Calculator
- Summary screen
- Navigation and routes

**Location:** `lib/presentation.dart/`

### Data Layer

Responsible for data models and communication with Firebase.

It includes:

- Material model
- Energy model
- Transport model
- Operation model
- Firestore service

**Location:** `lib/data.dart/`

### Core Layer

Contains shared constants and core configuration used throughout the application.

**Location:** `lib/core.dart/`

### Firebase Layer

Firebase provides the backend services for Green.

- **Firebase Authentication** — User registration and login
- **Cloud Firestore** — Storage of user carbon calculations

### Data Flow

**User Input → Carbon Calculation → Summary → Firestore**

This separation keeps the UI, calculation logic, data models, and backend services organized and easier to maintain.

---

## 📁 Project Structure

The main application code is organized inside the `lib` directory.

### `lib/main.dart`

Application entry point and Firebase initialization.

### `lib/core.dart/`

Contains shared constants and core configuration.

### `lib/data.dart/`

Contains:

- Data models
- Firestore service
- Backend-related data operations

### `lib/presentation.dart/`

Contains:

- Application screens
- Navigation
- User interface components

### `lib/presentation.dart/screens.dart/carboncalculator.dart/`

Contains the different stages of the carbon calculator:

- Materials
- Energy
- Transportation
- Operations
- Summary

---

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| **Flutter** | Cross-platform application framework |
| **Dart** | Programming language |
| **Material 3** | UI and design system |
| **Firebase Authentication** | User authentication |
| **Cloud Firestore** | Cloud database |
| **Flutter Lints** | Code quality and analysis |
| **Git & GitHub** | Version control |

### Main Dependencies

- `firebase_core`
- `firebase_auth`
- `cloud_firestore`
- `cupertino_icons`
- `flutter_lints`

---

## ☁️ Firebase Integration

Green uses Firebase for authentication and cloud data storage.

Each carbon calculation is associated with the authenticated user and stores information such as:

- User ID
- Timestamp
- Materials
- Energy
- Transportation
- Operations
- Total carbon footprint

This provides the foundation for storing and tracking carbon calculations over time.

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Android emulator or physical device
- Firebase project

### 1. Clone the repository

```bash
git clone https://github.com/aniketuuu/green.git
cd green
2. Install dependencies
flutter pub get
3. Configure Firebase

Connect the application to your Firebase project and enable:

Firebase Authentication
Cloud Firestore
4. Run the application
flutter run
🧪 Testing

Run the Flutter test suite:

flutter test

Check the project for analysis issues:

flutter analyze

Format the Dart code:

dart format .
🚧 Current Status

Green is currently a prototype with the core carbon-calculation functionality implemented.

Implemented
 Flutter application
 Onboarding
 Role selection
 Firebase Authentication
 User dashboard
 Carbon calculator
 Material calculations
 Energy calculations
 Transportation calculations
 Operations calculations
 Carbon-footprint summary
 Firestore integration
Future Development
 AI-powered sustainability recommendations
 Historical carbon-footprint tracking
 Sustainable material recommendations
 Energy-efficiency suggestions
 Green certification information
 Construction cost analysis
 Sustainability knowledge hub
 Policy information
 Community features
 Advanced project-level reporting
🔮 Future Vision

Green aims to evolve from a carbon calculator into a broader digital sustainability platform for the construction industry.

Future versions can help users identify high-emission activities and provide practical recommendations for reducing their project's carbon footprint.

The long-term vision is to help construction stakeholders make data-driven and environmentally responsible decisions.

👨‍💻 Developer

Aniket Choudhary

Built with Flutter, Dart & Firebase.

🌱 Green

Measure. Understand. Improve.

Building a greener future, one project at a time.
