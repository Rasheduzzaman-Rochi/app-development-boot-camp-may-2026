import 'package:flutter/material.dart';
import '../../../../core/models/expense_model.dart';
import '../../../../core/utils/constants.dart';

class HistoryListItem extends StatelessWidget {
  const HistoryListItem({super.key, required this.expense});

  final ExpenseModel expense;

  String _formatTime(DateTime date) {
    final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour >= 12 ? 'PM' : 'AM';
    return '${hour.toString().padLeft(2, '0')}:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    final timeText = _formatTime(expense.date);
    final accentColor =
        kCategoryAccentColors[expense.category] ?? const Color(0xFF6B7280);
    final softColor =
        kCategorySoftColors[expense.category] ?? const Color(0xFFF1F4F9);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: softColor,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(expense.icon, color: accentColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: kTitleTextColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$timeText • ${expense.category}',
                  style: const TextStyle(
                    color: kMutedTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatSignedAmount(expense.amount),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 23,
              color: kTitleTextColor,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
