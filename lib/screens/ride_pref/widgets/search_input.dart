import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;

  const SearchInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(BlaSpacings.m),
      child: Container(
        decoration: BoxDecoration(
          color: BlaColors.backgroundAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Search location',
            hintStyle: BlaTextStyles.label.copyWith(color: BlaColors.textLight),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: BlaSpacings.m,
              vertical: 14,
            ),
          ),
        ),
      ),
    );
  }
}
