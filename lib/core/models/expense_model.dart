import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String category;

  @HiveField(5)
  late int iconCodePoint;

  ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    IconData? icon,
  }) {
    iconCodePoint = icon?.codePoint ?? 0;
  }

  IconData get icon => IconData(iconCodePoint, fontFamily: 'MaterialIcons');
}
