import 'package:flutter/material.dart';
import 'package:flutter_lab/screens/weather_screen.dart';

import 'coffee_list_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = CoffeeScreen();
      case 1:
        page = WeatherScreen();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.coffee),
              label: 'Coffee',
            ),
            NavigationDestination(
              icon: Icon(Icons.sunny),
              label: 'Weather',
            ),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
        body: Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: page,
          ),
        ),
      );
    });
  }
}
