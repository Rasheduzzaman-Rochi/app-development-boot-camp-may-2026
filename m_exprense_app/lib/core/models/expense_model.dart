import 'package:flutter/material.dart';

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String category;
  final IconData icon;

  ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.icon,
  });
}