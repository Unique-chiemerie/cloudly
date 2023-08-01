import 'package:cloudly/currentcounry.dart';
import 'package:flutter/material.dart';

class Maincontent extends StatefulWidget {
  const Maincontent({super.key});

  @override
  State<Maincontent> createState() => _MaincontentState();
}

class _MaincontentState extends State<Maincontent> {
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
            Container(
              height: 100,
              width: 250,
              margin: const EdgeInsets.all(5),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.green,
                  hintText: 'Search Country',
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  hintStyle: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ]),
        ]),
        Nigeria(),
      ],
    );
  }
}
