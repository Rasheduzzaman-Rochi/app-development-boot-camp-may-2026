import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/models/expense_model.dart';
import '../../../../core/utils/constants.dart';
import '../../../../providers/expense_provider.dart';
import '../widgets/amount_input.dart';
import '../widgets/category_chips.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  String selectedCategory = 'Food';
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  final List<String> _months = const [
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

  String _formatDate(DateTime d) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(d.year, d.month, d.day);

    if (dateOnly == today) {
      return 'Today, ${d.day} ${_months[d.month - 1]}';
    }

    return '${d.day} ${_months[d.month - 1]}, ${d.year}';
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() => selectedDate = picked);
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _saveExpense() {
    if (_amountController.text.isEmpty) return;

    final parsedAmount = double.tryParse(_amountController.text);
    if (parsedAmount == null || parsedAmount <= 0) return;

    final newExpense = ExpenseModel(
      id: DateTime.now().toString(),
      title: _noteController.text.isEmpty
          ? selectedCategory
          : _noteController.text,
      amount: parsedAmount,
      date: selectedDate,
      category: selectedCategory,
      icon: kCategoryIcons[selectedCategory]!,
    );

    Provider.of<ExpenseProvider>(context, listen: false).addExpense(newExpense);
    _amountController.clear();
    _noteController.clear();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Expense saved')));
  }

  @override
  Widget build(BuildContext context) {
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      const Center(
                        child: Text(
                          'Add Expense',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: kTitleTextColor,
                            height: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Center(
                        child: Text(
                          'TRANSACTION DETAILS',
                          style: TextStyle(
                            fontSize: 11,
                            color: kMutedTextColor,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      AmountInput(controller: _amountController),
                      const SizedBox(height: 18),
                      Text(
                        'CATEGORY',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CategoryChips(
                        selectedCategory: selectedCategory,
                        onSelected: (category) =>
                            setState(() => selectedCategory = category),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'DATE',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: _pickDate,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: kCardColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_month_outlined,
                                color: kPrimaryColor,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                _formatDate(selectedDate),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: kTitleTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'NOTE',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: kCardColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _noteController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.notes_rounded,
                              color: kPrimaryColor,
                            ),
                            hintText: 'What was this for?',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: _saveExpense,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Save Expense',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
