import 'package:flutter/material.dart';
import '../core/models/expense_model.dart';

class ExpenseProvider extends ChangeNotifier {
  final List<ExpenseModel> _expenses = [
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
      date: DateTime(DateTime.now().year, 10, 24, 10, 0),
      category: 'Bills',
      icon: Icons.account_balance,
    ),
    ExpenseModel(
      id: '6',
      title: 'Equinox Membership',
      amount: 280.00,
      date: DateTime(DateTime.now().year, 10, 24, 6, 0),
      category: 'Shopping',
      icon: Icons.fitness_center,
    ),
  ];

  List<ExpenseModel> get expenses => _expenses;

  double get totalMonthlyExpense {
    return _expenses.fold(0.0, (sum, item) => sum + item.amount);
  }

  void addExpense(ExpenseModel expense) {
    _expenses.insert(0, expense); // Add to top of list
    notifyListeners();
  }
}
