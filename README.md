# 🌱 Green — Carbon Footprint Calculator

> **Build Green. Build Smart.**

Green is a Flutter-based mobile application designed to help construction stakeholders measure and understand the carbon footprint of their projects.

The app calculates emissions from **construction materials, energy consumption, transportation, and construction operations**, providing users with an overall project carbon footprint.

---

## 🎯 Objective

The goal of Green is to make carbon accounting simple and accessible for the construction sector.

The application follows a simple approach:

**Measure → Understand → Improve**

Users can calculate their emissions today, while future versions will provide recommendations to help reduce them.

---

## ✨ Features

- 🌿 Sustainability-focused onboarding
- 👤 Role selection for different construction stakeholders
- 🔐 Firebase email/password authentication
- 🏠 User dashboard
- 🧮 Construction carbon-footprint calculator
- 🧱 Material emission calculation
- ⚡ Energy emission calculation
- 🚛 Transportation emission calculation
- 🏗️ Construction operation emissions
- 📊 Total carbon-footprint summary
- ☁️ Cloud storage of calculations using Firebase Firestore

---

## 🧮 Carbon Calculator

The calculator consists of four major emission categories:

### 🧱 Materials
Users can enter construction materials and their quantities.

### ⚡ Energy
Users can enter electricity and fuel consumption.

### 🚛 Transportation
Transportation emissions are calculated using vehicle type, distance, and material weight.

### 🏗️ Operations
The app accounts for energy consumed during construction operations.

The final footprint is calculated as:

Total Carbon Footprint
= Materials
+ Energy
+ Transportation
+ Operations

The result is displayed in kg CO₂.

🏗️ Architecture

Green follows a lightweight layered architecture:

┌─────────────────────────┐
│    Presentation Layer   │
│  Screens & Navigation   │
└────────────┬────────────┘
             │
             ▼
┌─────────────────────────┐
│     Application Logic   │
│ Carbon Calculation      │
└────────────┬────────────┘
             │
             ▼
┌─────────────────────────┐
│       Data Layer        │
│ Models & Firestore      │
└────────────┬────────────┘
             │
             ▼
┌─────────────────────────┐
│        Firebase         │
│ Auth + Cloud Firestore  │
└─────────────────────────┘
Project Structure
lib/
├── core.dart/
│   └── const.dart
│
├── data.dart/
│   ├── models.dart/
│   │   ├── material_model.dart
│   │   ├── energymodel.dart
│   │   ├── transportmodel.dart
│   │   └── operationmodel.dart
│   │
│   └── services.dart/
│       └── firestore_service.dart
│
├── presentation.dart/
│   ├── navigation.dart/
│   │   └── routes.dart
│   │
│   └── screens.dart/
│       ├── splash.dart
│       ├── auth.dart
│       ├── signup.dart
│       ├── dashboard.dart
│       └── carboncalculator.dart/
│           ├── carbon_calculator_main.dart
│           ├── material_page.dart
│           ├── energypage.dart
│           ├── transportpage.dart
│           ├── operationpage.dart
│           └── summary.dart
│
└── main.dart


🛠️ Tech Stack
Technology	Purpose
Flutter	Cross-platform mobile application
Dart	Programming language
Material 3	UI and design system
Firebase Authentication	User authentication
Cloud Firestore	Cloud data storage
Flutter Lints	Code quality and analysis
Git & GitHub	Version control

Main Dependencies
firebase_core
firebase_auth
cloud_firestore
cupertino_icons
flutter_lints

☁️ Firebase Integration

Green uses Firebase for authentication and storing user calculations.

Each calculation is associated with the authenticated user's ID and includes:

User ID
Timestamp
Materials
Energy
Transportation
Operations
Total carbon footprint

🚀 Getting Started
1. Clone the repository
git clone https://github.com/aniketuuu/green.git
cd green
2. Install dependencies
flutter pub get
3. Configure Firebase

Connect the project to your Firebase project and enable:

Firebase Authentication
Cloud Firestore
4. Run the application
flutter run
🚧 Future Scope

Green is currently a prototype, with several features planned for future versions:

🤖 AI-powered sustainability recommendations
📊 Historical carbon-footprint tracking
🧱 Sustainable material recommendations
⚡ Energy-efficiency suggestions
🏆 Green certification information
💰 Construction cost analysis
📚 Sustainability knowledge hub
🏛️ Policy information
👥 Community features
👨‍💻 Developer

Aniket Choudhary

Built with Flutter, Dart & Firebase.

🌱 Vision

Green aims to evolve from a simple carbon calculator into a complete digital sustainability platform for the construction industry.
