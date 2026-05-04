import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF1E66CB);
const Color kCanvasColor = Color(0xFFF3F4F8);
const Color kCardColor = Color(0xFFFFFFFF);
const Color kMutedTextColor = Color(0xFF8A93A8);
const Color kTitleTextColor = Color(0xFF1D2230);

const Map<String, IconData> kCategoryIcons = {
  'Food': Icons.restaurant,
  'Transport': Icons.directions_car,
  'Bills': Icons.receipt,
  'Shopping': Icons.shopping_bag,
  'Entertainment': Icons.theater_comedy,
};

const Map<String, Color> kCategoryAccentColors = {
  'Food': Color(0xFFFF8B3D),
  'Transport': Color(0xFF4A78FF),
  'Bills': Color(0xFF5A83F8),
  'Shopping': Color(0xFF8F6CFF),
  'Entertainment': Color(0xFFFF6AB1),
};

const Map<String, Color> kCategorySoftColors = {
  'Food': Color(0xFFFFF1E6),
  'Transport': Color(0xFFEFF3FF),
  'Bills': Color(0xFFEDF2FF),
  'Shopping': Color(0xFFF2EEFF),
  'Entertainment': Color(0xFFFFEEF7),
};

String formatCurrency(double value) => '\$${value.toStringAsFixed(2)}';

String formatSignedAmount(double amount) => '-${formatCurrency(amount)}';
