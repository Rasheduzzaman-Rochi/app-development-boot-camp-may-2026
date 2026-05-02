import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key, required this.totalExpense});

  final double totalExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TOTAL MONTHLY EXPENSE',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            formatCurrency(totalExpense),
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
