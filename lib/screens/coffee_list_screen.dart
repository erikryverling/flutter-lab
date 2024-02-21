import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/spaces.dart' as spaces;

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
      coffeeList =
          coffeeListJson.map((element) => Coffee.fromJson(element)).toList();
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
            ? ListView.builder(
                padding: const EdgeInsets.all(spaces.normal),
                itemCount: coffeeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CoffeeItem(coffee: coffeeList[index]);
                })
            : CircularProgressIndicator());
  }
}

class CoffeeItem extends StatelessWidget {
  final Coffee coffee;

  const CoffeeItem({Key? key, required this.coffee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: spaces.small),
        padding: EdgeInsets.all(spaces.normal),
        color: Theme.of(context).colorScheme.surface,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: spaces.normal),
              child: Icon(
                Icons.coffee_outlined,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                size: 32.0,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coffee.name, style: Theme.of(context).textTheme.bodyLarge),
                Text("${coffee.roaster}, ${coffee.origin}",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: Theme.of(context).colorScheme.onSurfaceVariant)),
              ],
            )
          ],
        ));
  }
}
