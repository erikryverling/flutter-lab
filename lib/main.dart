import 'package:flutter/material.dart';
import 'package:flutter_lab/screens/main_screen.dart';
import 'package:flutter_lab/styles/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      // Note this make it look Material on both iOS and Android
      // We could also make in a CupertinoApp
      child: MaterialApp(
        title: 'Flutter Lab',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color(seedColor), brightness: Brightness.light),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color(seedColor), brightness: Brightness.dark),
        ),
        home: MainScreen(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {}
