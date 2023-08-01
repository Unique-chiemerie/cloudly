import 'package:flutter/material.dart';
import 'content.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 48, 3, 88),
                  Color.fromARGB(255, 94, 45, 168)
                ]),
              ),
            ),
          ),
          const Positioned.fill(
            child: Maincontent(),
          ),
        ],
      ),
    );
  }
}
