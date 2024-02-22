import 'package:flutter/material.dart';

import '../io/coffee.dart';

import '../styles/spaces.dart' as spaces;

class CoffeeDetailsScreen extends StatelessWidget {
  final Coffee coffee;

  const CoffeeDetailsScreen({Key? key, required this.coffee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          appBar: AppBar(title: Text(coffee.name)),
          body: Center(
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(spaces.normal),
                  child: Wrap(direction: Axis.vertical, children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: spaces.normal),
                      child: RichText(
                        text: TextSpan(
                          text: "Origin: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: coffee.origin,
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: spaces.normal),
                      child: RichText(
                        text: TextSpan(
                          text: "Roaster: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: coffee.roaster,
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(
                        text: "Region: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                              text: coffee.region,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    ),
                  ]))));
    });
  }
}