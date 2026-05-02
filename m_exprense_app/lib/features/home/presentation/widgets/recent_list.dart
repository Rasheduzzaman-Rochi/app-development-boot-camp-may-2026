import 'package:flutter/material.dart';

import '../../../../core/models/expense_model.dart';
import '../../../../core/utils/constants.dart';

class RecentList extends StatelessWidget {
  const RecentList({super.key, required this.expenses});

  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    final recentExpenses = expenses.length > 3
        ? expenses.take(3).toList()
        : expenses;

    if (recentExpenses.isEmpty) {
      return const Center(
        child: Text(
          'No transactions yet.',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      itemCount: recentExpenses.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final expense = recentExpenses[index];

        return Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(expense.icon, color: Colors.black54, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    expense.category,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
                  ),
                ],
              ),
            ),
            Text(
              '-${formatCurrency(expense.amount)}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        );
      },
    );
  }
}
