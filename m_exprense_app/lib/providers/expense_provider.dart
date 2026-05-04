import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../core/models/expense_model.dart';

class ExpenseProvider extends ChangeNotifier {
  late Box<ExpenseModel> _expenseBox;
  List<ExpenseModel> _expenses = [];
  bool _initialized = false;

  Future<void> init() async {
    _expenseBox = await Hive.openBox<ExpenseModel>('expenses');

    if (_expenseBox.isEmpty) {
      // Add default data only on first run
      final defaultExpenses = [
        ExpenseModel(
          id: '1',
          title: 'Blue Bottle Coffee',
          amount: 12.50,
          date: DateTime.now(),
          category: 'Food',
          icon: Icons.local_cafe_outlined,
        ),
        ExpenseModel(
          id: '2',
          title: 'Apple Store Soho',
          amount: 1299.00,
          date: DateTime.now().copyWith(hour: 14, minute: 20),
          category: 'Bills',
          icon: Icons.shopping_bag_outlined,
        ),
        ExpenseModel(
          id: '3',
          title: 'Uber Premium',
          amount: 42.80,
          date: DateTime.now().subtract(const Duration(days: 1, hours: 5)),
          category: 'Transport',
          icon: Icons.directions_car_outlined,
        ),
        ExpenseModel(
          id: '4',
          title: 'The Capital Grille',
          amount: 245.00,
          date: DateTime.now().subtract(const Duration(days: 1, hours: 8)),
          category: 'Food',
          icon: Icons.restaurant,
        ),
        ExpenseModel(
          id: '5',
          title: 'Rent Payment',
          amount: 3500.00,
          date: DateTime.now().copyWith(hour: 16, minute: 30),
          category: 'Bills',
          icon: Icons.account_balance,
        ),
        ExpenseModel(
          id: '6',
          title: 'Equinox Membership',
          amount: 280.00,
          date: DateTime.now().copyWith(hour: 10, minute: 15),
          category: 'Shopping',
          icon: Icons.fitness_center,
        ),
        ExpenseModel(
          id: '7',
          title: 'Rent Payment',
          amount: 3500.00,
          date: DateTime(2025, 10, 24, 10, 0),
          category: 'Bills',
          icon: Icons.account_balance,
        ),
        ExpenseModel(
          id: '8',
          title: 'Equinox Membership',
          amount: 280.00,
          date: DateTime(2025, 10, 24, 6, 0),
          category: 'Shopping',
          icon: Icons.fitness_center,
        ),
      ];

      for (final expense in defaultExpenses) {
        _expenseBox.add(expense);
      }
    }

    _expenses = _expenseBox.values.toList().reversed.toList();
    _initialized = true;
    notifyListeners();
  }

  List<ExpenseModel> get expenses => _expenses;

  double get totalMonthlyExpense {
    return _expenses.fold(0.0, (sum, item) => sum + item.amount);
  }

  void addExpense(ExpenseModel expense) {
    _expenseBox.add(expense);
    _expenses.insert(0, expense);
    notifyListeners();
  }
}
