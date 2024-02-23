import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../network/weather.dart';
import '../styles/spaces.dart' as spaces;

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
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: spaces.normal),
                      child: Text(
                        snapshot.data!.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      )),
                  Padding(
                      padding: EdgeInsets.only(bottom: spaces.normal),
                      child: Text(
                        '${snapshot.data!.temp} °',
                        style: GoogleFonts.vidaloka(
                            textStyle:
                                Theme.of(context).textTheme.displayMedium,
                            color: Theme.of(context).colorScheme.primary),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: spaces.large),
                          child: Text(
                            '${snapshot.data!.windSpeed} m/s',
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                      Text(
                        '${snapshot.data!.windDirection} °',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  )
                ]);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
