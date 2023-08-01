import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class nigeria {
  String main;
  String description;
  String icon;
  nigeria({required this.main, required this.description, required this.icon});
}

class Nigeria extends StatefulWidget {
  const Nigeria({super.key});

  @override
  State<Nigeria> createState() => _NigeriaState();
}

class _NigeriaState extends State<Nigeria> {
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //this is where the date shows , TOday, date
            Container(
              height: 30,
              width: 270,
              child: //this is where today and the date are fixed within the container ...
                  Row(
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
        //this is where the time will be shown after the Api is called,
        Container(
          margin: const EdgeInsets.all(10),
          color: Colors.green,
          height: 100,
          width: 270,
          child: Row(
            children: [
              //this is where we store the description
              Container(
                color: Colors.red,
                margin: const EdgeInsets.all(10),
                height: 100,
                width: 70,
              ),
              const SizedBox(
                width: 50,
              ),
              //this is where we call the icon from the Api we already have gotten
              Container(
                margin: const EdgeInsets.all(10),
                color: Colors.red,
                height: 100,
                width: 100,
              ),
            ],
          ),
        ),
        //this is where the location (NIGERIA) and city lagos shows on the UI
        Container(
          height: 30,
          width: 270,
          child:
              //we are displaying it in a row widget so it's more presentable and i can manipulate sizes better thereF
              Row(
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
      ]),
    );
  }
}
