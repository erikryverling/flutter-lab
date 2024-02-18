import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class CoffeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Center(child: Text("Coffee screen"));
  }
}