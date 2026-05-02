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
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          decoration: const InputDecoration(
            prefixText: '\$ ',
            prefixStyle: TextStyle(
              fontSize: 40,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            hintText: '0.00',
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
