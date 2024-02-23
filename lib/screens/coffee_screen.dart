import 'package:flutter/material.dart';

import '../io/coffee.dart';
import 'coffee_details_screen.dart';
import 'coffee_list_screen.dart';

class CoffeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Navigator(
        initialRoute: 'CoffeeListScreen',
        onGenerateRoute: (settings) {
          Widget screen = CoffeeListScreen();

          if (settings.name == 'CoffeeListScreen') {
            screen = CoffeeListScreen();
          } else if (settings.name == 'CoffeeDetailsScreen') {
            var coffee = settings.arguments as Coffee;
            screen = CoffeeDetailsScreen(coffee: coffee);
          }

          return MaterialPageRoute(builder: (_) => screen);
        },
      );
    });
  }
}
