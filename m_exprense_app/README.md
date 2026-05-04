# 💰 MExpense - Expense Tracker App

A beautiful, modern Flutter expense tracking application with persistent local storage, smooth navigation, and an intuitive user interface.

![Flutter](https://img.shields.io/badge/Flutter-3.11+-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.11+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

---

## 📱 Features

### Core Features
- ✅ **Track Expenses** - Add, view, and manage your daily expenses
- ✅ **Persistent Storage** - All data saved locally with Hive database
- ✅ **Category Management** - 5 predefined categories (Food, Transport, Bills, Shopping, Entertainment)
- ✅ **Date Tracking** - Automatic date recording for each transaction
- ✅ **History View** - Browse all transactions organized by date
- ✅ **Monthly Summary** - View total expenses for the current month

### UI/UX Features
- 🎨 **Modern Design** - Clean, solid color palette with white cards
- 🎯 **Smooth Navigation** - Animated bottom navigation with pill-shaped indicator
- ⚡ **Responsive Layout** - Optimized for different screen sizes
- 🎭 **Visual Feedback** - Shadows, animations, and proper spacing
- 📱 **Material Design** - Follows Flutter/Material Design guidelines

---

## 🏗️ Project Structure

```
lib/
├── main.dart                          # App entry point & theme configuration
├── core/
│   ├── models/
│   │   └── expense_model.dart        # Expense data model with Hive adapter
│   └── utils/
│       └── constants.dart            # Color palette & category definitions
├── features/
│   ├── navigation/
│   │   └── presentation/
│   │       ├── screens/
│   │       │   └── main_navigation_screen.dart
│   │       └── widgets/
│   │           └── nav_item.dart
│   ├── home/
│   │   └── presentation/
│   │       ├── screens/
│   │       │   └── home_screen.dart
│   │       └── widgets/
│   │           ├── summary_card.dart
│   │           └── recent_list.dart
│   ├── add_expense/
│   │   └── presentation/
│   │       ├── screens/
│   │       │   └── add_expense_screen.dart
│   │       └── widgets/
│   │           ├── amount_input.dart
│   │           └── category_chips.dart
│   └── expense_history/
│       └── presentation/
│           ├── screens/
│           │   └── history_screen.dart
│           └── widgets/
│               └── history_list_item.dart
└── providers/
    └── expense_provider.dart         # State management with Provider
```

---

## 🎨 Design System

### Color Palette
| Color | Hex | Usage |
|-------|-----|-------|
| Primary | `#1E66CB` | Buttons, selected items |
| Canvas | `#FBF8FF` | Background |
| Card | `#FFFFFF` | Cards, containers |
| Text Title | `#1D2230` | Headlines |
| Text Muted | `#8A93A8` | Secondary text |

### Typography
- **Font Family**: Inter (Google Fonts)
- **Headlines**: 24-38px, Bold (700)
- **Body Text**: 12-16px, Regular (500)
- **Small Text**: 10-11px, Semi-bold (600)

### Category Colors
- **Food**: Accent `#F97316`, Background `#FED7AA`
- **Transport**: Accent `#0EA5E9`, Background `#BAE6FD`
- **Bills**: Accent `#8B5CF6`, Background `#E9D5FF`
- **Shopping**: Accent `#EC4899`, Background `#FBCFE8`
- **Entertainment**: Accent `#F59E0B`, Background `#FEE2E2`

---

## 🚀 Getting Started

### Prerequisites
- **Flutter**: 3.11.0 or higher
- **Dart**: 3.11.0 or higher
- **iOS**: Xcode 15.0+ (for iOS development)
- **Android**: Android Studio with SDK 21+

### Installation

1. **Clone the repository**
   ```bash
   cd m_exprense_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Hive adapters**
   ```bash
   dart run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2          # State management
  google_fonts: ^6.2.1      # Typography
  hive: ^2.2.3              # Local database
  hive_flutter: ^1.1.0      # Hive for Flutter

dev_dependencies:
  build_runner: ^2.4.0      # Code generation
  hive_generator: ^2.0.0    # Hive adapter generator
```

---

## 🗄️ Database Architecture

### Hive Setup
The app uses **Hive** for local persistent storage:
- **Database**: `expenses` box stores all `ExpenseModel` objects
- **Serialization**: Custom `ExpenseModelAdapter` handles data persistence
- **Icon Storage**: `IconData` stored as integer code points to maintain serializability

### Data Model
```dart
@HiveType(typeId: 0)
class ExpenseModel extends HiveObject {
  @HiveField(0) final String id;
  @HiveField(1) final String title;
  @HiveField(2) final double amount;
  @HiveField(3) final DateTime date;
  @HiveField(4) final String category;
  @HiveField(5) late int iconCodePoint;
}
```

---

## 🔄 State Management

### Provider Pattern
The app uses **Provider** for reactive state management:

```dart
class ExpenseProvider extends ChangeNotifier {
  Future<void> init() async {
    // Initialize Hive box and load expenses
  }
  
  void addExpense(ExpenseModel expense) {
    // Save to Hive and notify listeners
  }
}
```

### Key Methods
- `init()` - Initialize database on app startup
- `addExpense()` - Add new expense and persist
- `expenses` - Get all expenses (getter)
- `totalMonthlyExpense` - Calculate monthly total

---

## 🎯 Main Screens

### 1. Home Screen
- Monthly expense summary card
- Recent transactions list (latest 4)
- Quick overview of spending
- User profile header

### 2. Add Expense Screen
- Amount input with 3-digit validation
- Category selection grid (5 categories)
- Date picker
- Note/description field
- Save button with form validation

### 3. Expense History Screen
- Transactions grouped by date
- "TODAY" section (current day)
- "YESTERDAY" section (previous day)
- Older dates in reverse chronological order
- Individual transaction details

### 4. Bottom Navigation
- 3-tab navigation (Home, Add, History)
- Animated pill-shaped active indicator
- Smooth tab switching

---

## ⚙️ Configuration

### App Theme
Located in `main.dart`:
- **Scaffold Background**: `#FBF8FF`
- **App Bar**: White with no elevation
- **Bottom Nav**: White background

### Category Mapping
Defined in `core/utils/constants.dart`:
```dart
kCategoryIcons = {
  'Food': Icons.local_cafe_outlined,
  'Transport': Icons.directions_car_outlined,
  'Bills': Icons.account_balance,
  'Shopping': Icons.shopping_bag_outlined,
  'Entertainment': Icons.movie_outlined,
}
```

---

## 🔧 Development Guide

### Adding New Features

#### 1. Create New Feature
```
lib/features/feature_name/
├── presentation/
│   ├── screens/
│   │   └── feature_screen.dart
│   └── widgets/
│       └── feature_widget.dart
└── models/
    └── feature_model.dart
```

#### 2. Update Navigation
Edit `main_navigation_screen.dart` to add new tab.

#### 3. Add to Provider
Update `expense_provider.dart` if needed for state management.

### Modifying Models
After changing `expense_model.dart`:
```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 📊 Testing the App

### Manual Testing Checklist
- [ ] App launches without errors
- [ ] Home screen displays monthly summary
- [ ] Recent transactions list shows latest expenses
- [ ] Add Expense: Can select category and add expense
- [ ] Add Expense: Amount validation (max 999.99)
- [ ] Date picker works correctly
- [ ] History screen groups by date correctly
- [ ] Navigation between tabs is smooth
- [ ] Data persists after app restart
- [ ] UI responsive on different screen sizes

### Flutter Analysis
```bash
# Check code quality
flutter analyze

# Run in verbose mode for debugging
flutter run -v
```

---

## 🐛 Troubleshooting

### Build Errors

**Error**: `Unhandled Exception: HiveError: Cannot write, unknown type`
- **Solution**: Run `dart run build_runner build` to regenerate adapters

**Error**: `The named parameter 'icon' is required`
- **Solution**: Icon parameter is now optional; check `ExpenseModel` constructor

### Runtime Issues

**Database not persisting**
- Clear app data: `flutter clean && flutter pub get`
- Rebuild adapters: `dart run build_runner build`

**Transactions not displaying**
- Check Hive box initialization in `ExpenseProvider.init()`
- Verify Hive adapter is registered in `main.dart`

---

## 📈 Performance Optimizations

- **ListView.separated** - Efficient rendering of large lists
- **const constructors** - Reduced unnecessary rebuilds
- **Hive Database** - Fast local data access
- **Provider** - Minimal widget rebuilds on state changes
- **Lazy loading** - Home screen limits recent transactions

---

## 🔐 Security & Best Practices

- ✅ No sensitive data stored unencrypted
- ✅ Local-only database (no network requests)
- ✅ Input validation on amount field
- ✅ Safe date handling with DateTime
- ✅ Null-safety enabled throughout

---

## 📝 Code Style

- **Language**: Dart 3.11+
- **Style**: Follows Effective Dart guidelines
- **Formatting**: `dart format` (enforced)
- **Analysis**: `flutter analyze` (zero issues)
- **Naming**: camelCase for variables, PascalCase for classes

---

## 🤝 Contributing

### Branch Strategy
- `main` - Production-ready code
- `develop` - Development branch
- `feature/*` - Feature branches

### Commit Messages
```
feat: Add expense filtering
fix: Resolve database initialization issue
refactor: Reorganize widget structure
docs: Update README
```

---

## 📄 License

This project is licensed under the MIT License - see LICENSE file for details.

---

## 👨‍💻 Author

**Rashed Uzzaman**
- Role: Flutter Developer
- Email: [Your Email]
- GitHub: [Your GitHub Profile]

---

## 🙏 Acknowledgments

- Flutter Team for amazing framework
- Provider for state management
- Hive for local storage solution
- Material Design for UI/UX guidelines

---

## 📞 Support

For issues, questions, or suggestions:
- 📧 Email: [your-email@example.com]
- 🐛 Report bugs via GitHub Issues
- 💬 Discussions for feature requests

---

## 🗺️ Roadmap

### Current Version (v1.0.0)
- ✅ Basic expense tracking
- ✅ Local database persistence
- ✅ Category management
- ✅ Transaction history

### Future Features (v2.0.0)
- 📊 Charts and analytics
- 💾 Cloud sync
- 📅 Budget planning
- 🔔 Expense reminders
- 📤 Export to CSV/PDF
- 🌙 Dark mode
- 🔐 Biometric authentication

---

**Last Updated**: May 4, 2026  
**Version**: 1.0.0  
**Status**: ✅ Production Ready
