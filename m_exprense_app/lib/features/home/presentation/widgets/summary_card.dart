import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key, required this.totalExpense});

  final double totalExpense;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF3A61E8),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'TOTAL MONTHLY EXPENSE',
              style: TextStyle(
                color: Color(0xFFD9E2FF),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              formatCurrency(totalExpense),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
