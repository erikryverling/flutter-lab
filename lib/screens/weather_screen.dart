import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../network/Weather.dart';

class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Weather>(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // TODO There are probably a more dynamic way to achieve this
            return SizedBox(
                height: 180,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        snapshot.data!.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "${snapshot.data!.temp} °",
                        style: GoogleFonts.vidaloka(
                            textStyle:
                                Theme.of(context).textTheme.displayMedium,
                            color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                          width: 180,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${snapshot.data!.windSpeed} m/s",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                "${snapshot.data!.windDirection} °",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ))
                    ]));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
