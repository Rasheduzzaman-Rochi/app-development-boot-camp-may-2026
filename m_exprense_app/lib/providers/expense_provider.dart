import 'package:flutter/material.dart';
import '../core/models/expense_model.dart';

class ExpenseProvider extends ChangeNotifier {
  final List<ExpenseModel> _expenses = [
    ExpenseModel(
      id: '1',
      title: 'Groceries',
      amount: 82.50,
      date: DateTime.now(),
      category: 'Food & Dining',
      icon: Icons.shopping_cart_outlined,
    ),
    ExpenseModel(
      id: '2',
      title: 'Coffee',
      amount: 4.20,
      date: DateTime.now().subtract(const Duration(days: 1)),
      category: 'Food & Dining',
      icon: Icons.local_cafe_outlined,
    ),
    ExpenseModel(
      id: '3',
      title: 'Transport',
      amount: 15.00,
      date: DateTime(2024, 10, 12),
      category: 'Transportation',
      icon: Icons.directions_car_outlined,
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