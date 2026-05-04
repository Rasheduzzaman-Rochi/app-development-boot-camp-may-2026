import 'package:flutter/material.dart';

import '../../../../core/models/expense_model.dart';
import '../../../../core/utils/constants.dart';

class RecentList extends StatelessWidget {
  const RecentList({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  String _getRelativeDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly == today) {
      return 'Today';
    }
    if (dateOnly == yesterday) {
      return 'Yesterday';
    }

    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${date.day} ${months[date.month - 1]}';
  }

  String _formatTime(DateTime date) {
    final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour >= 12 ? 'PM' : 'AM';
    return '${hour.toString().padLeft(2, '0')}:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    final recentExpenses = expenses.length > 4
        ? expenses.take(4).toList()
        : expenses;

    if (recentExpenses.isEmpty) {
      return const Center(
        child: Text(
          'No transactions yet.',
          style: TextStyle(color: kMutedTextColor),
        ),
      );
    }

    return ListView.separated(
      itemCount: recentExpenses.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final expense = recentExpenses[index];
        final accentColor =
            kCategoryAccentColors[expense.category] ?? const Color(0xFF6B7280);
        final softColor =
            kCategorySoftColors[expense.category] ?? const Color(0xFFF1F4F9);

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
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
                      '${expense.category} • ${_getRelativeDate(expense.date)}, ${_formatTime(expense.date)}',
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
                  fontSize: 16,
                  color: kTitleTextColor,
                  height: 1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
