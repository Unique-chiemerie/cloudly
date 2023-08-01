import 'package:flutter/material.dart';
import 'package:cloudly/homepage.dart';

void main() {
  runApp(
    const MaterialApp(
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
                  Color.fromARGB(255, 48, 3, 88),
                  Color.fromARGB(255, 94, 45, 168)
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
