import 'package:flutter/material.dart';
import 'package:my_location_tracker/viewmodels/location_viewmodel.dart';
import 'package:provider/provider.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final locationViewModel = Provider.of<LocationViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Location: ${locationViewModel.currentLocation}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                locationViewModel.updateLocation();
                //
                // show a message to the user
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Location updated!')),
                );
              },
              child: const Text('Update Location'),
            ),
          ],
        ),
      ),
    );
  }
}