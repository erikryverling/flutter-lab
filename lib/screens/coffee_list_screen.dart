import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../io/coffee.dart';

class CoffeeScreen extends StatefulWidget {
  @override
  State<CoffeeScreen> createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  late List<Coffee> coffeeList;

  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/coffee.json');
    final List coffeeListJson = jsonDecode(jsonString)['coffee'];

    setState(() {
      coffeeList = coffeeListJson.map((element) => Coffee.fromJson(element)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: coffeeList.isNotEmpty
            ? Text(coffeeList.first.origin)
            : CircularProgressIndicator());
  }
}
