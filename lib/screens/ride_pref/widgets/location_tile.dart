import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';
import '../../../theme/theme.dart';

class LocationTile extends StatelessWidget {
  final Location location;
  final bool isSelected;

  const LocationTile({
    super.key,
    required this.location,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: () => Navigator.pop(context, location),
        title: Text(
          location.name,
          style: BlaTextStyles.body.copyWith(
            color: isSelected ? BlaColors.primary : BlaColors.textNormal,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        trailing: isSelected
            ? const Icon(Icons.arrow_forward_ios, size: 20) : null,
      ),
    );
  }
}
