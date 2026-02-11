import 'package:flutter/material.dart';
import '../../model/ride/locations.dart';
import '../../theme/theme.dart';
import 'widgets/search_input.dart';
import 'widgets/current_location_tile.dart';
import 'widgets/locations_list.dart';

enum PickerMode { departure, arrival }

class LocationPickerScreen extends StatefulWidget {
  final PickerMode mode;
  final Location? selectedLocation;

  const LocationPickerScreen({
    super.key,
    required this.mode,
    this.selectedLocation,
  });

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() => _searchQuery = _searchController.text.toLowerCase());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String get _title =>
      widget.mode == PickerMode.departure ? 'Leaving from' : 'Going to';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _title,
          style: BlaTextStyles.body.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SearchInput(controller: _searchController),
          CurrentLocationTile(
            onSelected: (location) => Navigator.pop(context, location),
          ),
          Expanded(
            child: LocationsList(
              searchQuery: _searchQuery,
              selectedLocation: widget.selectedLocation,
            ),
          ),
        ],
      ),
    );
  }
}
