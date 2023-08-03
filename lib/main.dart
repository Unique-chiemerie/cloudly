import 'package:flutter/material.dart';
import 'package:cloudly/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Color.fromARGB(121, 0, 0, 0),
      ),
      debugShowCheckedModeBanner: false,
      home: CloudlyMain(),
    ),
  );
}

class CloudlyMain extends StatefulWidget {
  const CloudlyMain({super.key});

  @override
  State<CloudlyMain> createState() => _CloudlyMainState();
}

class _CloudlyMainState extends State<CloudlyMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 33, 33, 33),
                ],
              ),
            ),
          ),
          const Expanded(
            child: homepage(),
          ),
        ],
      ),
    );
  }
}
