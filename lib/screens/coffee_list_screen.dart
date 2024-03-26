import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../io/coffee.dart';
import '../styles/spaces.dart' as spaces;

class CoffeeListScreen extends StatefulWidget {
  @override
  State<CoffeeListScreen> createState() => _CoffeeListScreenState();
}

class _CoffeeListScreenState extends State<CoffeeListScreen> {
  late List<Coffee> coffeeList;

  Future<void> loadJsonFile() async {
    final String jsonString =
        await rootBundle.loadString('assets/coffees.json');
    final List coffeeListJson = jsonDecode(jsonString)['coffees'];

    setState(() {
      coffeeList =
          coffeeListJson.map((element) => Coffee.fromJson(element)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonFile();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(title: Text("Coffee")),
        body: Center(
            child: coffeeList.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.all(spaces.normal),
                    itemCount: coffeeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CoffeeItem(coffee: coffeeList[index]);
                    })
                : CircularProgressIndicator()),
      );
    });
  }
}

class CoffeeItem extends StatelessWidget {
  const CoffeeItem({Key? key, required this.coffee}) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: spaces.normal),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "CoffeeDetailsScreen",
                  arguments: coffee);
            },
            child: Ink(
                padding: EdgeInsets.all(spaces.normal),
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: spaces.normal),
                      child: Icon(
                        Icons.coffee_outlined,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        size: 26.0,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(coffee.name,
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text('${coffee.roaster}, ${coffee.origin}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant)),
                      ],
                    )
                  ],
                ))));
  }
}
