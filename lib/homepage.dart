import 'package:flutter/material.dart';
import 'Mainscreen.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

Widget welcome = const Text(
  'Weather',
  style:
      TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 30),
);
Widget remainder = const Text(
  'News\n'
  '   & Feed',
  style: TextStyle(
      fontWeight: FontWeight.w600, color: Colors.yellowAccent, fontSize: 30),
);
Widget cloudly = const Text(
  'Cloudly',
  style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 246, 246, 77),
      fontSize: 50),
);
Widget textbody = const Expanded(
  child: Text(
    'Get weather updates of various\n'
    'countries of the world at the tap of a button,\n'
    'use cloudly today!!\n',
    style: TextStyle(
        fontWeight: FontWeight.w600, color: Colors.white, fontSize: 15),
  ),
);

class _homepageState extends State<homepage> {
  void getStarted() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const Mainscreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        cloudly,
        const SizedBox(
          height: 100,
        ),
        Container(
          height: 300,
          width: 350,
          margin: const EdgeInsets.all(5),
          child: Image.network(
              'https://img.icons8.com/?size=2x&id=SpZSUswN9tJs&format=png'),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            welcome,
            const SizedBox(
              width: 20,
            ),
            Container(margin: const EdgeInsets.only(top: 38), child: remainder),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        textbody,
        ElevatedButton(
          onPressed: () {
            getStarted();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 241, 218, 12),
          ),
          child: const Text('Get Started'),
        ),
      ],
    );
  }
}
