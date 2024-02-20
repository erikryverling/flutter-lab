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
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data!.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    snapshot.data!.temp.toString(),
                    style: GoogleFonts.vidaloka(textStyle: Theme.of(context).textTheme.displayMedium),
                  ),
                  Text(
                    snapshot.data!.windSpeed.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    snapshot.data!.windDirection.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
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
