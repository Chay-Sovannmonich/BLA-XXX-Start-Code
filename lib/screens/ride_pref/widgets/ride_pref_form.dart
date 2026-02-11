import 'package:flutter/material.dart';
import 'ride_pref_field.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../widgets/display/bla_divider.dart';
import '../../../widgets/actions/bla_button.dart';
import '../../../utils/date_time_util.dart';
import '../../../dummy_data/dummy_data.dart';
import '../../../theme/theme.dart';
import '../../../screens/ride_pref/location_picker_screen.dart'; 

///
/// A Ride Preference Form is a view to select:
///   - A departure location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    if (widget.initRidePref != null) {
      departure = widget.initRidePref!.departure;
      departureDate = widget.initRidePref!.departureDate;
      arrival = widget.initRidePref!.arrival;
      requestedSeats = widget.initRidePref!.requestedSeats;
    } else {
      departure = fakeLocations[0];
      departureDate = DateTime.now();
      requestedSeats = 1;
    }
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  void toLocationPicker({required bool isDeparture, Location? location}) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LocationPickerScreen(
          mode: isDeparture ? PickerMode.departure : PickerMode.arrival,
          selectedLocation: location,
        ),
      ),
    );
    if (result != null && result is Location) {
      setState(() {
        if (isDeparture) {
          departure = result;
        } else {
          arrival = result;
        }
      });
    }
  }

  void onDepartureTap() {
    toLocationPicker(isDeparture: true, location: departure);
  }

  void onArrivalTap() {
    toLocationPicker(isDeparture: false, location: arrival);
  }

  void onSwapLocation() {
    setState(() {
      var temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  String get departureLabel => departure?.name ?? 'Leaving from';
  String get arrivalLabel => arrival?.name ?? 'Going to';

  void onSearch() {
    if (departure == null) {
      onDepartureTap();
    } else if (arrival == null) {
      onArrivalTap();
    }
    //to ride screen
  }

  bool isSwapVisible() {
    return departure != null || arrival != null;
  }

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(BlaSpacings.radius),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: BlaSpacings.l),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: BlaSpacings.s),
                BlaPrefFormField(
                  label: departureLabel,
                  onTap: onDepartureTap,
                  onTrailingTap: isSwapVisible() ? onSwapLocation : null,
                ),
                const BlaDivider(),
                BlaPrefFormField(label: arrivalLabel, onTap: onArrivalTap),
                const BlaDivider(),
                BlaPrefFormField(
                  label: DateTimeUtils.formatDateTime(departureDate),
                  onTap: () {},
                  icon: Icons.date_range_outlined,
                ),
                BlaPrefFormField(
                  label: requestedSeats.toString(),
                  onTap: () {},
                  icon: Icons.person_outline,
                ),
              ],
            ),
          ),
          BlaButton(label: 'Search', onPressed: onSearch),
        ],
      ),
    );
  }
}
