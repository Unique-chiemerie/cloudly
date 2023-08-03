import 'package:cloudly/currentcounry.dart';
import 'package:flutter/material.dart';

import 'country_list.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

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

class Maincontent extends StatefulWidget {
  const Maincontent({super.key});

  @override
  State<Maincontent> createState() => _MaincontentState();
}

class _MaincontentState extends State<Maincontent> {
//the unchanged fuction for the search bar goes hard here

  List<Countrytileinfo> filtered = [];
  void searchb(String search) {
    setState(() {
      if (search.isNotEmpty) {
        filtered = countrylist
            .where(
              (country) => country.countryname
                  .toLowerCase()
                  .contains(search.toLowerCase()),
            )
            .toList();
        print("Filtered Countries: $filtered");
      } else {
        filtered = countrylist;
      }
    });
  }

  late Future<List<WeatherData>> futurama;
  @override
  void initState() {
    super.initState();
    filtered = countrylist;
    futurama = fetchallcountries();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(children: [
          Container(
            margin: const EdgeInsets.all(5),
            height: 50,
            width: 50,
            child: Center(
              child: Image.network(
                  'https://img.icons8.com/?size=2x&id=pRGHNxNNTREQ&format=png'),
            ),
          ),
          Column(children: [
            const SizedBox(
              height: 12,
            ),
            //this is the search bar do all your
            //search bar operations should take place here ...
            Container(
              height: 100,
              width: 250,
              margin: const EdgeInsets.all(5),
              child: TextField(
                onChanged: searchb,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Search Country',
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ]),
        ]),
        //this is the card displaying the Nigeria card and allat.
        Nigeria(),
        const SizedBox(
          height: 40,
        ),
        //This is the country's list view
        FutureBuilder(
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
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    print("Filtered List Length: ${filtered.length}");
                    print("Filtered List: $filtered");

//this is the ontap of our build
                    void tapcun() {
                      showModalBottomSheet(
                        backgroundColor: Color.fromARGB(137, 27, 23, 33),
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 300,
                            width: 300,
                            margin: const EdgeInsets.all(10),
                            child: //this will show the components of the modal sheet
                                Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'weather description: ${weatherdatalist[index].description}\n'
                                      'main weather : ${weatherdatalist[index].main}',
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ), //this one was the description ,
                              //weather icon goes here:
                              Center(
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  height: 100,
                                  width: 100,
                                  child: Image.network(
                                    'https://openweathermap.org/img/w/${weatherdatalist[index].icone}.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      countrylist[index].countryname,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 248, 238, 152),
                                          fontSize: 20),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      margin: const EdgeInsets.all(10),
                                      child: countrylist[index].countrypfp,
                                    ),
                                  ]),
                            ]),
                          );
                        },
                      );
                    }

                    //this is the build
                    return InkWell(
                      onTap: () {
                        tapcun();
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 70,
                        width: 270,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 255, 255, 255),
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
                            //country name

                            Container(
                              margin: const EdgeInsets.all(5),
                              height: 50,
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    countrylist[index].countryname,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
