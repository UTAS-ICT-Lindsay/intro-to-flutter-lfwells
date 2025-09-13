import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2 - Making Widgets (Complete)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Flutter Widgets"),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MyEpicTextBox(color: Colors.red),
                MyEpicTextBox(color: Color.fromRGBO(133, 33, 37, 1.0)),
                MyEpicTextBox(color: Theme.of(context).colorScheme.primary),
              ],
            )
        )
    );
  }
}

// Custom Widget with a color parameter
class MyEpicTextBox extends StatelessWidget {
  final Color color; // (1) Add a member variable for the color

  const MyEpicTextBox({
    super.key,
    required this.color, // (2) Add to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello, Flutter!',
      style: TextStyle(fontSize: 24, color: color), // (3) Use the color parameter here
    );
  }
}