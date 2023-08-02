import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Nigeria extends StatefulWidget {
  const Nigeria({super.key});

  @override
  State<Nigeria> createState() => _NigeriaState();
}

class _NigeriaState extends State<Nigeria> {
  late Future<NigeriaData> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchNigeria();
  }

  @override
  Widget build(BuildContext context) {
    DateTime unfdate = DateTime.now();
    String currentdate = DateFormat('E d, MMM').format(unfdate);
    return Container(
      height: 200,
      width: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(87, 0, 0, 0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 270,
                child: Row(
                  children: [
                    const Text(
                      'Today',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    Text(
                      currentdate,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 270,
            child: Row(
              children: [
                // Weather Icon
                FutureBuilder<NigeriaData>(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text('An error occurred');
                    } else if (snapshot.hasData) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        height: 100,
                        width: 70,
                        child: Image.network(
                          'https://openweathermap.org/img/w/${snapshot.data!.icon}.png',
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                const SizedBox(width: 50),
                // Weather Description
                FutureBuilder<NigeriaData>(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Text(
                          'There was an error from the dev angle');
                    } else if (snapshot.hasData) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        height: 100,
                        width: 100,
                        child: Text(snapshot.data!.description),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: 270,
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: Image.network(
                      'https://img.icons8.com/?size=2x&id=Bdm9Ljn0yyGl&format=png'),
                ),
                const Text(
                  'Africa Nigeria , Lagos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 252, 242, 153),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NigeriaData {
  final String main;
  final String description;
  final String icon;

  NigeriaData({
    required this.main,
    required this.description,
    required this.icon,
  });

  factory NigeriaData.fromJson(Map<String, dynamic> json) {
    return NigeriaData(
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}

Future<NigeriaData> fetchNigeria() async {
  String apikey = '3ee39fa2aedd4f162371ac6359962293';
  final apireply = await http.get(
    Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Nigeria&appid=$apikey'),
  );
  if (apireply.statusCode == 200) {
    return NigeriaData.fromJson(jsonDecode(apireply.body));
  } else {
    throw Exception('Failed to get data');
  }
}
