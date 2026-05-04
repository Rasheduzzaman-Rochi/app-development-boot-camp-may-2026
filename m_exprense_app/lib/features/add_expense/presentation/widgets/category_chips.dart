import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({
    super.key,
    required this.selectedCategory,
    required this.onSelected,
  });

  final String selectedCategory;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final categories = [...kCategoryIcons.keys, 'More'];

    return GridView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.99,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        final isMore = category == 'More';
        final isSelected = selectedCategory == category;
        final softColor =
            kCategorySoftColors[category] ?? const Color(0xFFF3F4F9);
        final accentColor =
            kCategoryAccentColors[category] ?? const Color(0xFF8F98AE);

        return Container(
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(12),
            border: isMore
                ? Border.all(color: const Color(0xFFCED5E6), width: 1.2)
                : null,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: isMore ? null : () => onSelected(category),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFEEF3FF)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: isSelected
                    ? Border.all(color: kPrimaryColor, width: 1.2)
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isMore ? const Color(0xFFF1F4FA) : softColor,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Icon(
                      isMore ? Icons.add : kCategoryIcons[category],
                      color: isMore ? const Color(0xFF7E879A) : accentColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kTitleTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
