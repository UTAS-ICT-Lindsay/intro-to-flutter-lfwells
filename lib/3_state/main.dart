import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3 - State',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final Map<String, int> options = {
    "Flutter": 0,
    "Native Kotlin": 0,
    "Native Swift": 0
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Flutter State is a State of Mind"),
        ),
        body: Center(
            child: SizedBox(
              width:400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("What is the best mobile development framework?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  ),

                  // Dynamically create PollOption widgets based on the options list
                  for (var option in options.entries) PollOption(text: option.key, votes: option.value)
                ],
              ),
            )
        )
    );
  }
}

// Custom Widget
class PollOption extends StatelessWidget {
  final String text;
  final int votes;

  const PollOption({
    super.key,
    required this.text,
    required this.votes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
        ElevatedButton(onPressed: () {
          // TODO: add button handling code here:

        }, child: Text("Vote ($votes)")),
      ],
    );
  }
}