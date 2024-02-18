import 'package:flutter/material.dart';
import 'package:flutter_lab/screens/main_screen.dart';
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
      child: MaterialApp(
        title: 'Flutter Lab',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF4F99AD)),
        ),
        home: MainScreen(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {
}