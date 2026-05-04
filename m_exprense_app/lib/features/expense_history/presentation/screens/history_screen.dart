import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/models/expense_model.dart';
import '../../../../core/utils/constants.dart';
import '../widgets/history_list_item.dart';
import '../../../../providers/expense_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  List<_HistorySection> _groupExpenses(List<ExpenseModel> expenses) {
    final grouped = <DateTime, List<ExpenseModel>>{};

    for (final expense in expenses) {
      final dateKey = DateTime(
        expense.date.year,
        expense.date.month,
        expense.date.day,
      );
      grouped.putIfAbsent(dateKey, () => <ExpenseModel>[]).add(expense);
    }

    final keys = grouped.keys.toList()..sort((a, b) => b.compareTo(a));

    return [
      for (final key in keys)
        _HistorySection(title: _formatSectionTitle(key), items: grouped[key]!),
    ];
  }

  String _formatSectionTitle(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    const months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC',
    ];
    final dateOnly = DateTime(date.year, date.month, date.day);
    final monthDay = '${months[date.month - 1]} ${date.day}';

    if (dateOnly == today) {
      return 'TODAY';
    }

    if (dateOnly == yesterday) {
      return 'YESTERDAY';
    }

    return monthDay;
  }

  @override
  Widget build(BuildContext context) {
    final expenseData = Provider.of<ExpenseProvider>(context);
    final sections = _groupExpenses(expenseData.expenses);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(18, 6, 18, 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x11000000),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 4),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: const Color(0xFFD7E1FF),
                    child: Icon(
                      Icons.person,
                      size: 16,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'MExpense',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    const Text(
                      'Expense History',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w700,
                        color: kTitleTextColor,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Track your precision spending habits',
                      style: TextStyle(
                        color: kMutedTextColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.separated(
                        itemCount: sections.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemBuilder: (context, sectionIndex) {
                          final section = sections[sectionIndex];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  section.title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                    color: kMutedTextColor,
                                  ),
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: section.items.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10),
                                itemBuilder: (context, index) {
                                  return HistoryListItem(
                                    expense: section.items[index],
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistorySection {
  const _HistorySection({required this.title, required this.items});

  final String title;
  final List<ExpenseModel> items;
}
