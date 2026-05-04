import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/utils/constants.dart';

class _MaxThreeDigitsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // Allow only digits and one decimal point
    if (text.isEmpty) return newValue;

    // Split by decimal
    List<String> parts = text.split('.');

    // If more than one decimal point, reject
    if (parts.length > 2) {
      return oldValue;
    }

    // Limit integer part to 3 digits
    if (parts[0].length > 3) {
      return oldValue;
    }

    return newValue;
  }
}

class AmountInput extends StatelessWidget {
  const AmountInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 1),
              child: Text(
                '\$',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF5D87FF),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: 120,
              child: TextField(
                controller: controller,
                inputFormatters: [_MaxThreeDigitsFormatter()],
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: kTitleTextColor,
                  height: 1,
                ),
                decoration: const InputDecoration(
                  hintText: '0.00',
                  hintStyle: TextStyle(color: Color(0xFF2E3240)),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isCollapsed: true,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
