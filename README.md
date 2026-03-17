# 🐾 Pet Adoption App (Flutter)

A modern, high-performance pet adoption application built with **Flutter**, following **Clean Architecture** principles and using **Firebase** for a real-time backend.

## 🚀 Key Features
* **Admin Management:** Add new pets with detailed information (Name, Category, Breed, Age) and image integration.
* **Real-time Synchronization:** Users see pet updates instantly via Firestore Streams without manual refresh.
* **Smart Filtering:** Easily browse through categories (Dogs, Cats, or All Pets).
* **Responsive UI:** Crafted with an **Indigo color palette** (0xFF007AFF) and optimized for both Light and Dark modes.
* **Predictable State:** State management handled by **Bloc/Cubit** for a robust user experience.

---

## 🏗 Architecture & Design
This project is built using **Clean Architecture** to ensure the codebase is scalable, testable, and maintainable.

### The 3-Layer Approach:
1. **Data Layer:** Handles API/Firebase communication, Repository implementations, and Data Models (DTOs).
2. **Domain Layer:** The "Brain" of the app. Contains Business Logic, Entities, Repository Interfaces, and Use Cases.
3. **Presentation Layer:** UI Widgets and State Management (Cubit/Bloc).



### Tech Stack:
* **Framework:** [Flutter](https://flutter.dev/)
* **State Management:** [Flutter Bloc / Cubit](https://pub.dev/packages/flutter_bloc)
* **Backend:** [Firebase Cloud Firestore](https://firebase.google.com/docs/firestore)
* **Dependency Injection:** [Get_it](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable)
* **Code Generation:** [Freezed](https://pub.dev/packages/freezed) & [Build Runner](https://pub.dev/packages/build_runner)
* **Navigation:** [GoRouter](https://pub.dev/packages/go_router)

---

## 📂 Project Structure
```text
lib/
 ├── core/              # Dependency Injection, Routing, Themes, Constants
 ├── module/            # Feature-based modules (TIS style)
 │    └── pet_adoption/
 │         ├── data/         # Models, Repositories Impl, Datasources
 │         ├── domain/       # Entities, Repositories Interface, UseCases
 │         └── presentation/ # Pages, Cubits, Widgets (View/Form split)
 └── main.dart
