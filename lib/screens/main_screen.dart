import 'package:flutter/material.dart';
import 'package:flutter_lab/screens/weather_screen.dart';

import 'coffees_screen.dart';

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
        page = CoffeesScreen();
      case 1:
        page = WeatherScreen();
      default:
        throw UnimplementedError('No screen for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(Icons.coffee),
              icon: Icon(Icons.coffee_outlined),
              label: 'Coffees',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.wb_cloudy),
              icon: Icon(Icons.wb_cloudy_outlined),
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
