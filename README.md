<div align="center">

# 🍇 Fruits Hub

**E-Commerce Mobile Application & Live Admin Dashboard**

</div>

## 📖 Overview

**Fruits Hub** is a modern cross-platform e-commerce mobile application built with Flutter, featuring a customer-facing shopping app and a live admin dashboard synchronized in real-time using Firebase. It delivers a complete, secure end-to-end purchase journey—from product discovery and cart management to shipping addresses and secure PayPal checkout—powered by Clean Architecture and Supabase cloud storage.

<br>

<img width="2623" height="959" alt="Product Overview" src="https://github.com/user-attachments/assets/bdfccb4e-59a3-4816-a995-4c6e2f1ca33e" />

</div>

## ✨ Core Features

| # | Screen / Feature | Description |
|---|------------------|-------------|
| 1 | Splash & Onboarding | Introduction and welcome screens |
| 2 | Authentication | Secure sign-in and sign-up authentication flow |
| 3 | Home & Catalog | Browse fresh products, categories, and recommendations |
| 4 | Search & Filter | Fast product search and category filtering |
| 5 | Cart & Checkout | End-to-end purchase journey including cart, shipping addresses, and secure PayPal checkout |
| 6 | Favorites | Save and manage favorite items seamlessly |
| 7 | Profile & Orders | Track user profile, order history, and account settings |
| 8 | Admin Dashboard | Real-time synchronized admin dashboard for managing store data via Firebase |

## 🧱 Tech Stack & Architecture

- **Framework:** Flutter & Dart
- **Architecture:** Clean Architecture (Data → Domain → Presentation) following SOLID principles
- **State Management:** BLoC / Cubit
- **Backend & Real-Time Sync:** Firebase Auth & Cloud Firestore (Live Admin Dashboard synchronization)
- **Cloud Storage:** Supabase for scalable storage and cross-platform synchronization
- **Payment Integration:** PayPal secure checkout gateway

## 📁 Project Structure

```text
fruits-hub
├── core/                  # Shared app-wide core components
│   ├── constants/          # API endpoints, keys, and global constants
│   ├── theme/              # Colors, typography, and styling tokens
│   ├── routing/            # App routes and navigation setup
│   ├── widgets/            # Shared reusable widgets (buttons, cards, inputs)
│   ├── utils/              # Helpers, extensions, and formatters
│   └── errors/             # Failure/exception handling classes
│
└── features/              # Feature-based Clean Architecture modules
    ├── auth/
    │   ├── data/           # Auth repository & Firebase data sources
    │   ├── domain/         # Auth entities & use cases
    │   └── presentation/   # Login, Register screens & BLoC
    │
    ├── home/
    │   ├── data/           # Product models & remote data sources
    │   ├── domain/         # Product entities & use cases
    │   └── presentation/   # Discover screen, category lists, and BLoC
    │
    ├── cart/
    │   ├── data/           # Cart data implementation
    │   ├── domain/         # Cart management use cases
    │   └── presentation/   # Cart items UI and state management
    │
    ├── checkout/
    │   ├── data/           # Checkout, shipping, and PayPal payment integration
    │   ├── domain/         # Checkout use cases
    │   └── presentation/   # Address, shipping, and payment UI
    │
    ├── favorites/
    │   ├── data/           # Favorites data source
    │   ├── domain/         # Favorites use cases
    │   └── presentation/   # Favorite items screen and widgets
    │
    ├── profile/
    │   ├── data/           # User profile data source
    │   ├── domain/         # Profile use cases
    │   └── presentation/   # User profile and settings UI
    │
    └── admin/
        ├── data/           # Admin live dashboard data sync via Firebase
        ├── domain/         # Admin management use cases
        └── presentation/   # Live admin dashboard UI and management tools<img width="2623" height="959" alt="Product Overview" src="https://github.com/user-attachments/assets/fcf69764-4b37-4101-851f-8cc03baf5d18" />
