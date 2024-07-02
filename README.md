# KingHotel

KingHotel is a Flutter-based mobile application developed as part of the Year 3 Semester 2 curriculum at Beltei International University, Campus 2.
This project is scheduled for completion on August 02, 2024.

## Vision

KingHotel aims to revolutionize the hotel booking experience by providing a seamless, user-friendly platform that connects travelers with a wide range of accommodations.
Our vision is to become the go-to app for hotel reservations, offering personalized recommendations and exceptional customer service.

## Purpose

The primary purposes of the KingHotel app are:

1. To simplify the hotel booking process for travelers worldwide
2. To provide a platform for hotels to showcase their offerings and reach a broader audience
3. To implement and demonstrate advanced Flutter development techniques learned during the course
4. To create a scalable and maintainable codebase that can serve as a foundation for future enhancements

## Key Features

- User-friendly interface for browsing and booking hotels
- Advanced search and filtering options
- Secure payment integration
- User profiles with booking history and preferences
- Real-time notifications for bookings and promotions
- Multi-language support for a global user base

## Technology Stack

- Flutter for cross-platform mobile development
- Firebase for backend services and authentication
- RESTful APIs for hotel data integration
- Git for version control

## Team

- **Sokla Lor (CoreLaZz)**
- **Bunheng Leng (Dustin)**
- **Lyheng Long (Lyporkven)**
- **E Ek**

## Team Responsible

- **Sokla Lor (CoreLaZz)** - Developer
- **Bunheng Leng (Dustin)** - Developer

## Project Status

This project is started in August 02, 2024.
The expected completion is August 05, 2024.

## License

This project is part of an academic curriculum and is not licensed for commercial use. Sokla Lor - Bunheng Leng

---

For more information, please contact Sokla Lor at [soklalor007@gmail.com].

## Our Project Struture

This Project Struture base on professional folder struture looking clean and easy to manage.

```text

lib/
├── core/
│   ├── constants/
│   │   ├── api_constants.dart                  // API endpoints, keys, timeouts
│   │   ├── app_constants.dart                  // App-wide constants like dimensions, durations
│   │   └── asset_constants.dart                // Paths to images, fonts, etc.
│   ├── errors/
│   │   ├── exceptions.dart                     // Custom exception classes
│   │   ├── failures.dart                       // Failure classes for domain layer
│   │   └── error_handler.dart                  // Centralized error handling logic
│   ├── utils/
│   │   ├── input_validator.dart                // Input validation functions
│   │   ├── date_formatter.dart                 // Date formatting utilities
│   │   ├── string_extensions.dart              // Extension methods for String
│   │   └── network_info.dart                   // Network connectivity checker
│   ├── themes/
│   │   ├── app_themes.dart                     // Theme data for light/dark modes
│   │   ├── text_styles.dart                    // Reusable text styles
│   │   └── color_palette.dart                  // App color definitions
│   └── network/
│       ├── network_client.dart                 // Base network client (e.g., Dio configuration)
│       └── api_endpoints.dart                  // Enum or class defining API endpoints
├── data/
│   ├── datasources/
│   │   ├── local/
│   │   │   ├── shared_preferences_helper.dart  // Local storage helper
│   │   │   ├── database_helper.dart            // SQLite database helper
│   │   │   └── secure_storage_helper.dart      // Secure storage for sensitive data
│   │   └── remote/
│   │       ├── api_client.dart                 // HTTP client for API calls
│   │       ├── user_remote_datasource.dart     // User-related API calls
│   │       └── product_remote_datasource.dart  // Product-related API calls
│   ├── models/
│   │   ├── user_model.dart                     // Data models that implement entities
│   │   ├── product_model.dart                  // Product data model
│   │   └── response/
│   │       ├── api_response.dart               // Generic API response model
│   │       └── error_response.dart             // Error response model
│   └── repositories/
│       ├── user_repository_impl.dart           // Implementation of user repository
│       └── product_repository_impl.dart        // Implementation of product repository
├── domain/
│   ├── entities/
│   │   ├── user.dart                           // User entity
│   │   └── product.dart                        // Product entity
│   ├── repositories/
│   │   ├── user_repository.dart                // User repository contract
│   │   └── product_repository.dart             // Product repository contract
│   └── usecases/
│       ├── user/
│       │   ├── get_user.dart                   // Use case for retrieving user data
│       │   ├── update_user.dart                // Use case for updating user data
│       │   └── delete_user.dart                // Use case for deleting user
│       └── product/
│           ├── get_products.dart               // Use case for fetching products
│           └── add_product.dart                // Use case for adding a new product
├── presentation/
│   ├── blocs/
│   │   ├── auth/
│   │   │   ├── auth_bloc.dart                  // Authentication business logic
│   │   │   ├── auth_event.dart                 // Auth events
│   │   │   └── auth_state.dart                 // Auth states
│   │   └── product/
│   │       ├── product_bloc.dart               // Product-related business logic
│   │       ├── product_event.dart              // Product events
│   │       └── product_state.dart              // Product states
│   ├── pages/
│   │   ├── home/
│   │   │   ├── home_page.dart                  // Home screen widget
│   │   │   └── widgets/                        // Home-specific widgets
│   │   ├── profile/
│   │   │   ├── profile_page.dart               // Profile screen widget
│   │   │   └── widgets/                        // Profile-specific widgets
│   │   └── product/
│   │       ├── product_list_page.dart          // Product list screen
│   │       └── product_detail_page.dart        // Product detail screen
│   └── widgets/
│       ├── custom_button.dart                  // Reusable custom button widget
│       ├── user_avatar.dart                    // User avatar display widget
│       ├── loading_indicator.dart              // Custom loading indicator
│       └── error_dialog.dart                   // Reusable error dialog
├── config/
│   ├── routes.dart                             // App route definitions
│   ├── dependency_injection.dart               // Dependency injection setup (e.g., using get_it)
│   └── app_config.dart                         // Environment-specific configurations
├── localization/
│   ├── app_localizations.dart                  // Localization delegate and helper methods
│   ├── app_localizations_delegate.dart         // Custom LocalizationsDelegate
│   └── language/
│       ├── en.json                             // English translations
│       ├── es.json                             // Spanish translations
│       └── fr.json                             // French translations
└── main.dart                                   // App entry point, runApp() call

```

### Additional details

1. `core/network/`: Contains base networking setup, which can be used across the app.

2. `data/models/response/`: Includes models for standardized API responses.

3. `domain/usecases/`: Organized by feature (user, product) for better scalability.

4. `presentation/pages/`: Each major screen has its own directory with page-specific widgets.

5. `config/app_config.dart`: Manages environment-specific settings (dev, staging, production).

6. `localization/app_localizations_delegate.dart`: Custom delegate for more control over localization.

This structure is designed for large-scale applications, emphasizing:

- Separation of concerns
- Testability
- Scalability
- Maintainability

It follows clean architecture principles, allowing for easy changes to data sources or UI without affecting core business logic.
