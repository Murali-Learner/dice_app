import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceApp(),
    );
  }
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int diceNum = 1;
  bool loading = false;
  void changeNum() async {
    setState(() {
      loading = true;
      diceNum = Random().nextInt(6) + 1;
    });
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Dice App"),
      ),
      body: Center(
        child: loading
            ? const CircularProgressIndicator.adaptive(
                strokeWidth: 10,
              )
            : GestureDetector(
                onTap: () {
                  changeNum();
                },
                child: Card(
                  margin: const EdgeInsets.all(10),
                  color: Colors.teal,
                  child: Image.asset("assets/images/dice$diceNum.png"),
                ),
              ),
      ),
    );
  }
}
