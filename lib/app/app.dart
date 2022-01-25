import 'package:flutter/material.dart';
import 'package:study/pages/start_route.dart';

class RandomizerApp extends StatelessWidget{
  const RandomizerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Randomizer',
     theme: ThemeData(
       primarySwatch: Colors.amber,
     ),
     home:  StartRoute(),
   );
  }
}