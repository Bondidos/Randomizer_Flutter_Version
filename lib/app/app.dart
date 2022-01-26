import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:study/pages/start_route.dart';

import '../pages/result_route.dart';

class RandomizerApp extends StatelessWidget{
  const RandomizerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Randomizer',
     initialRoute: 'first',
     routes: {
       'first': (context) => const StartRoute(),
       'second': (context) => const ResultRoute(result: 0,), //todo remove
     },
     theme: ThemeData(
       primarySwatch: Colors.amber,
     ),
     home:  const StartRoute(),
   );
  }
}

class ScreenArguments{
  final int value;
  ScreenArguments(this.value);
}