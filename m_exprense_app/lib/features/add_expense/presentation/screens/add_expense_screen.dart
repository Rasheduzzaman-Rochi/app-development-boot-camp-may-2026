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

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _saveExpense() {
    if (_amountController.text.isEmpty) return;

    final newExpense = ExpenseModel(
      id: DateTime.now().toString(),
      title: _noteController.text.isEmpty
          ? selectedCategory
          : _noteController.text,
      amount: double.parse(_amountController.text),
      date: DateTime.now(),
      category: selectedCategory,
      icon: kCategoryIcons[selectedCategory]!,
    );

    Provider.of<ExpenseProvider>(context, listen: false).addExpense(newExpense);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add New Expense',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.04),
              Center(
                child: SizedBox(
                  width: size.width * 0.5,
                  child: AmountInput(controller: _amountController),
                ),
              ),

              SizedBox(height: size.height * 0.05),

              const Text(
                'CATEGORY',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 12),
              CategoryChips(
                selectedCategory: selectedCategory,
                onSelected: (category) =>
                    setState(() => selectedCategory = category),
              ),

              SizedBox(height: size.height * 0.04),

              const Text(
                'DATE',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Today, ${DateTime.now().day} Oct',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const Divider(height: 32, thickness: 1, color: Colors.black12),

              const Text(
                'NOTE (OPTIONAL)',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              TextField(
                controller: _noteController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.notes, color: Colors.grey, size: 20),
                  hintText: 'What was this for?',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
              const Divider(height: 16, thickness: 1, color: Colors.black12),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: _saveExpense,
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text(
                    'Save Expense',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E66CB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
