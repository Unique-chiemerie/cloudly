import 'package:flutter/material.dart';
import 'package:cloudly/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color.fromARGB(121, 0, 0, 0),
      ),
      debugShowCheckedModeBanner: false,
      home: const CloudlyMain(),
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
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 0, 0, 0),
                          Color.fromARGB(255, 33, 33, 33),
                        ],
                      ),
                    ),
                  ),
                ),
                const homepage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
