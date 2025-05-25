import 'package:flutter/material.dart';
import 'package:my_location_tracker/viewmodels/location_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:my_location_tracker/views/location_view.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationViewModel()),
      ],
      child: MaterialApp(
        home: LocationView(),
      ),
    );
  }
}