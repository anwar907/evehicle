# eVehicle - Electric Bike Rental App

A Flutter application for exploring and renting electric bikes with a clean, modern UI and robust architecture.

## 1. How to Run

### Prerequisites

- Flutter SDK (3.10.1 or higher)
- Dart SDK
- Android Studio / Xcode / Chrome (depending on target platform)

### Setup

```bash
# Clone the repository
git clone <repository-url>
cd evehicle

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Platform-Specific Commands

**Android:**

```bash
flutter run --dart-define=URL=<your-supabase-url> --dart-define=SUPABASE_ANON_KEY=<your-key>
```

**iOS:**

```bash
flutter run -d ios
```

**Web:**

```bash
flutter run -d chrome
```

### Environment Variables

Create a `.vscode/launch.json` file or pass environment variables:

```bash

{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "evehicle (debug mode)",
      "request": "launch",
      "type": "dart",
      "flutterMode": "debug",
      "program": "lib/main.dart",
      "args": [
        "--dart-define=SUPABASE_ANON_KEY=...",
        "--dart-define=URL=..."
      ]
    },
    {
      "name": "evehicle (release mode)",
      "request": "launch",
      "type": "dart",
      "flutterMode": "release",
      "program": "lib/main.dart",
      "args": [
        "--dart-define=SUPABASE_ANON_KEY=...",
        "--dart-define=URL=..."
      ]
    }
  ]
}

```

## 2. Architecture Overview

The application follows a **Clean Architecture** pattern with **BLoC (Business Logic Component)** for state management. The project is structured into multiple layers:

- **Presentation Layer**: Contains UI widgets, pages, and BLoC/Cubit for state management. Each feature module (home, login, navigation, etc.) has its own view and viewmodel structure.
- **Domain Layer**: Implemented through repository packages that define contracts and business logic interfaces.
- **Data Layer**: Repository implementations handle data fetching from local (Mock Data JSON) and remote (Supabase) sources.

The architecture promotes separation of concerns, testability, and scalability. Features are modularized into packages (local_repository, remote_repository, vehicle_repository, etc.) making the codebase maintainable and allowing independent development of features.

## 3. Decisions & Trade-offs

### Key Decisions:

**State Management - BLoC/Cubit:**

- **Decision**: Used BLoC pattern for complex state (Vehicle, Promotions, Packages) and Cubit for simpler state (Navigation, Splash/Onboarding)
- **Trade-off**: More boilerplate code but better testability and predictable state flow
- **Benefit**: Clear separation between business logic and UI, easier debugging

**Repository Pattern:**

- **Decision**: Created separate repository packages for different data sources
- **Trade-off**: More initial setup time but better modularity
- **Benefit**: Easy to swap implementations, better testing, clear data flow

**Local Storage - SharedPreferences:**

- **Decision**: Used SharedPreferences for simple key-value storage (rental interests, tokens)
- **Trade-off**: Limited to simple data types, not suitable for complex queries
- **Benefit**: Simple, fast, and sufficient for current requirements

**Mock Data - JSON Assets:**

- **Decision**: Used local JSON files for vehicle, promotions, and package data
- **Trade-off**: Not real-time, requires app update for data changes
- **Benefit**: Works offline, faster development, no backend dependency for demo

**UI Framework - Material Design:**

- **Decision**: Stuck with Material Design components with custom theming
- **Trade-off**: Less unique design but faster development
- **Benefit**: Consistent UX, accessibility built-in, well-documented

**Navigation:**

- **Decision**: Used named routes with custom NavigatorHelper
- **Trade-off**: Manual route management vs auto-generated routes
- **Benefit**: Full control, easier to understand, no code generation needed

### Notable Trade-offs:

1. **StatelessWidget over StatefulWidget**: Prioritized stateless widgets with BLoC for state management, making code more predictable but requiring more setup

2. **Monorepo Structure**: Kept repositories as local packages instead of separate repos, easier for small team but less flexible for large teams

3. **No Dependency Injection Framework**: Used manual dependency injection through constructors, simpler but more verbose

## 4. What I'd Do Next With More Time

### High Priority:

1. **Complete Backend Integration**

   - Implement full Supabase authentication flow
   - Create real-time data sync for vehicles and bookings

2. **Testing**

   - Unit tests for BLoCs/Cubits and repositories
   - Widget tests for critical user flows
   - Integration tests for end-to-end scenarios

3. **Enhanced Features**
   - Payment integration for rental bookings
   - Real-time vehicle availability maps tracking

### Medium Priority:

4. **UI/UX Improvements**

   - Add animations and transitions
   - Implement skeleton loaders
   - Dark mode support
   - Accessibility improvements (screen reader support, contrast ratios)

5. **Performance Optimization**

   - Image caching and optimization
   - Lazy loading for lists
   - Code splitting for web

6. **Developer Experience**
   - Add code generation for routes and models
   - Implement CI/CD pipeline
   - Add linting rules and pre-commit hooks
   - API documentation

### Low Priority:

7. **Advanced Features**

   - Multi-language support (i18n)
   - Analytics integration
   - A/B testing framework
   - Offline-first architecture with sync

8. **Code Quality**
   - Implement proper logging system
   - Add performance monitoring
   - Code coverage reports

## 5. AI Tools Usage

### Tools Used:

**Amazon Q Developer** was extensively used throughout the development process.

### How AI Was Used:

1. **Code Generation & Scaffolding**

   - Generated boilerplate code for BLoC/Cubit patterns
   - Built UI components with consistent styling

2. **Architecture Decisions**

   - Reviewed code structure and organization

3. **Problem Solving**

   - Debugged ProviderNotFoundException issues

4. **Code Refactoring**

   - Converted StatefulWidget to StatelessWidget with BLoC
   - Created reusable widgets and components

5. **Documentation**
   - Generated mock JSON data for vehicles and packages
   - Created this comprehensive README
   - Added inline code comments where necessary

---

## Project Structure

```
evehicle/
├── lib/
│   ├── app/
│   │   ├── helpers/          # Navigation, SharedPreferences helpers
│   │   ├── modules/          # Feature modules (home, login, etc.)
│   │   ├── themes/           # Color themes and styling
│   │   ├── utils/            # Extensions and utilities
│   │   ├── app.dart          # Main app widget
│   │   └── app_routes.dart   # Route definitions
│   └── main.dart
├── packages/
│   ├── local_repository/     # Local data handling
│   ├── remote_repository/    # Supabase integration
│   ├── vehicle_repository/   # Vehicle data logic
│   └── ...
├── assets/
│   ├── data/                 # Mock JSON data
│   └── img/                  # Images
└── pubspec.yaml
```

## Dependencies

- **flutter_bloc**: State management
- **equatable**: Value equality
- **supabase_flutter**: Backend integration
- **shared_preferences**: Local storage
- **carousel_slider**: Image carousel
- **flutter_map**: Map integration
- **animated_bottom_navigation_bar**: Navigation UI

## License

This project is for demonstration purposes.
