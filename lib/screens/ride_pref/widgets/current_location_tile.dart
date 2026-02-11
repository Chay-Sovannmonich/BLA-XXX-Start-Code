import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';
import '../../../service/locations_service.dart';
import '../../../theme/theme.dart';

class CurrentLocationTile extends StatelessWidget {
  final Function(Location) onSelected;

  const CurrentLocationTile({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: BlaSpacings.m),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: BlaColors.greyLight),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.my_location,
            size: 20,
          ),
        ),
        title: Text('Use current location', style: BlaTextStyles.body),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
      ),
    );
  }
}
