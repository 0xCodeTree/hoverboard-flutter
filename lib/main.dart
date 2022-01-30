import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  // Phoenix package is used to restart the application from scratch, losing any previous state.
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colored Tile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 75),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemCount: 25,
                itemBuilder: (context, idx) {
                  return const ColorTile();
                }),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 70),
          height: 50,
          width: 100,
          child: ElevatedButton(
              onPressed: () {
                Phoenix.rebirth(context);
              },
              child: const Text('Reset')),
        ),
      ],
    );
  }
}

class ColorTile extends StatefulWidget {
  const ColorTile({Key? key}) : super(key: key);

  @override
  _ColorTileState createState() => _ColorTileState();
}

class _ColorTileState extends State<ColorTile> {
  var color = Colors.grey;
  var colors = [
    Colors.blue,
    Colors.amber,
    Colors.purple,
    Colors.pink,
    Colors.yellow,
    Colors.blueAccent,
    Colors.white,
    Colors.brown,
    Colors.deepOrange,
    Colors.green,
    Colors.indigo
  ];

  getRandomColor() {
    final _random = Random();
    return colors[_random.nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          color = getRandomColor();
        });
      },
      onDoubleTap: () {
        setState(() {
          color = Colors.grey;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(8),
        color: color,
      ),
    );
  }
}
