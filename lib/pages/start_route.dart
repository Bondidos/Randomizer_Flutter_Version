import 'dart:math';
import 'package:flutter/material.dart';
import 'package:study/pages/result_route.dart';

class StartRoute extends StatefulWidget {
  const StartRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartRoutState();
}

class StartRoutState extends State<StartRoute> {
  String? _errorFirstText;
  String? _errorSecondText;
  int? firstValue;
  int? secondValue;
  int result = 0;
  // get() {
  //   generateRandom(firstValue ?? 0,secondValue ?? 0);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate a number'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (text) {
              setState(() {
                if(isValid(text)){
                  _errorFirstText = null;
                  firstValue = int.tryParse(text);
                } else {
                  _errorFirstText = 'Not valid value';
                }
              });
            },
            decoration: InputDecoration(
                hintText: 'Input min. value', errorText: errorFirstText()),
          ),
          const Divider(),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (text) {
              setState(() {
                if(isValid(text)){
                  _errorSecondText = null;
                  secondValue = int.tryParse(text);
                } else {
                  _errorSecondText = 'Not valid value';
                }
              });
            },
            decoration: InputDecoration(
                hintText: 'Input max. value', errorText: errorSecondText()),
          ),
          const Divider(),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResultRoute(
                              result: 0 ,
                            )));
              },
              child: const Text('Generate'))
        ],
      )),
    );
  }
  String r() => "5";

  String? errorFirstText() => _errorFirstText;
  String? errorSecondText() => _errorSecondText;

  bool isValid(String em) {
    String validRegexp = '^[0-9]+\$';

    RegExp regExp = RegExp(validRegexp);

    return regExp.hasMatch(em);
  }

  int generateRandom(int first, int second){
    var _generator = Random();

    int _result = 0 ;
    while(_result <= first){
      _result = _generator.nextInt(second);
    }
    return _result;
  }
}
