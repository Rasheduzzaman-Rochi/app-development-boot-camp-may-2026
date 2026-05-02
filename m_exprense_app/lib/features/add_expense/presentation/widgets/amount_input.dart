import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';

class AmountInput extends StatelessWidget {
  const AmountInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'AMOUNT',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            prefix: Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                color: const Color(0xFFFCF9F8),
                child: Text(
                  '\$',
                  style: const TextStyle(
                    fontSize: 36,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            hintText: '0.00',
            hintStyle: TextStyle(color: Colors.grey.shade400),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
            ),
            isCollapsed: false,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ),
      ],
    );
  }
}
