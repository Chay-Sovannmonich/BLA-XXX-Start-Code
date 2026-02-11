import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: BlaColors.backgroundAccent,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.location_off_outlined,
              size: 48,
            ),
          ),
          const SizedBox(height: BlaSpacings.m),
          Text('No locations found', style: BlaTextStyles.body),
          const SizedBox(height: BlaSpacings.s),
          Text(
            'Try searching for a different city',
            style: BlaTextStyles.label,
          ),
        ],
      ),
    );
  }
}
