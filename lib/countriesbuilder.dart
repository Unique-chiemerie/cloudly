import 'dart:convert';

import 'package:flutter/material.dart';
import 'country_list.dart';
import 'package:http/http.dart' as http;
//let's perform the api calls and all here!!

class WeatherData {
  String countree;
  String main;
  String description;
  String icone;

  WeatherData(
      {required this.countree,
      required this.main,
      required this.description,
      required this.icone});

  factory WeatherData.fromjson(String country, Map<String, dynamic> json) {
    return WeatherData(
        countree: country,
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        icone: json['weather'][0]['icon']);
  }
}

Future<List<WeatherData>> fetchallcountries() async {
  String apikey = '3ee39fa2aedd4f162371ac6359962293';
  List<WeatherData> weatherdatalist = [];

  for (Countrytileinfo country in countrylist) {
    final countryApi = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=${country.countryname}&appid=${apikey}'),
    );
    if (countryApi.statusCode == 200) {
      weatherdatalist.add(WeatherData.fromjson(
          country.countryname, jsonDecode(countryApi.body)));
    } else {
      throw Exception('failed to get data for ${country.countryname}');
    }
  }
  return weatherdatalist;
}

// country class is here

class countrylistview extends StatefulWidget {
  const countrylistview({super.key});

  @override
  State<countrylistview> createState() => _countrylistviewState();
}

class _countrylistviewState extends State<countrylistview> {
  late Future<List<WeatherData>> futurama;

  @override
  void initState() {
    super.initState();
    futurama = fetchallcountries();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futurama,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('failed to get data'),
          );
        } else {
          List<WeatherData> weatherdatalist = snapshot.data!;

          return Expanded(
            child: ListView.builder(
              itemCount: weatherdatalist.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  height: 70,
                  width: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(87, 0, 0, 0),
                  ),
                  child: Row(
                    children: [
                      //this is where the country logo goes to
                      Container(
                        margin: const EdgeInsets.all(5),
                        height: 50,
                        width: 50,
                        child: countrylist[index].countrypfp,
                      ), //done with this !!!!
                      //weather description goes here

                      Container(
                        margin: const EdgeInsets.all(5),
                        height: 50,
                        width: 150,
                        color: Colors.red,
                        child: Text(weatherdatalist[index].description),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      //weather icon goes here
                      Container(
                        margin: const EdgeInsets.all(5),
                        height: 50,
                        width: 50,
                        color: Colors.green,
                        child: Image.network(
                            'https://openweathermap.org/img/w/${weatherdatalist[index].icone}.png'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
