import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';
import '../../../service/locations_service.dart';
import '../../../theme/theme.dart';
import 'location_tile.dart';
import 'empty_state.dart';

class LocationsList extends StatelessWidget {
  final String searchQuery;
  final Location? selectedLocation;

  const LocationsList({
    super.key,
    required this.searchQuery,
    this.selectedLocation,
  });

  List<Location> get _filteredLocations {
    if (searchQuery.isEmpty) return []; 
    return LocationsService.availableLocations
        .where((loc) => loc.name.toLowerCase().contains(searchQuery))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (searchQuery.isEmpty) {
      return const SizedBox.shrink(); 
    }

    if (_filteredLocations.isEmpty) {
      return const EmptyState();
    }

    final Map<Country, List<Location>> grouped = {};
    for (var loc in _filteredLocations) {
      grouped.putIfAbsent(loc.country, () => []).add(loc);
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: BlaSpacings.m),
      itemCount: grouped.length,
      itemBuilder: (ctx, idx) {
        final country = grouped.keys.elementAt(idx);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: BlaSpacings.s),
              child: Text(
                country.name,
                style: BlaTextStyles.label.copyWith(
                  fontWeight: FontWeight.w600,
                  color: BlaColors.textLight,
                ),
              ),
            ),
            ...grouped[country]!.map(
              (loc) => LocationTile(
                location: loc,
                isSelected: selectedLocation == loc,
              ),
            ),
          ],
        );
      },
    );
  }
}
