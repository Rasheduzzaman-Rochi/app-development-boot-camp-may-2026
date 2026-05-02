import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF1E66CB);

const Map<String, IconData> kCategoryIcons = {
  'Food': Icons.restaurant,
  'Transport': Icons.directions_car,
  'Bills': Icons.receipt,
  'Shopping': Icons.shopping_bag,
};

String formatCurrency(double value) => '\$${value.toStringAsFixed(2)}';