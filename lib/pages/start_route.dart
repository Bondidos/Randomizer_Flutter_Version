import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:study/app/app.dart';
import 'package:study/pages/result_route.dart';

const MAX_INT = 2147483647;

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
  int? result;

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
              // Padding()
              Text(
                  'Previous result is: $result'
              ),
              const Divider(),
              TextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                onChanged: (text) {
                  setState(() {
                    if (_isValid(text) && (int.tryParse(text) ?? 0) <= MAX_INT) {
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
                maxLength: 10,
                onChanged: (text) {
                  setState(() {
                    if (_isValid(text) &&
                        (int.tryParse(text) ?? 0) <= MAX_INT) {
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
                    if (firstValue != null && secondValue != null &&
                        firstValue! < secondValue!) {
                      _navigateToResultRouteAndGetResult(context);
                      /*Navigator.pushNamed(
                          context,
                          'second',
                        arguments: ScreenArguments(_generateRandom(
                            firstValue ?? 0, secondValue ?? 0))
                      );*/
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              AlertDialog(
                                title: const Text(
                                    'Wrong values. "first should be less then second" '),
                                actions: <Widget>[
                                  TextButton(onPressed: () =>
                                      Navigator.pop(context, 'Cancel')
                                      , child: const Text('OK'))
                                ],
                              )
                      );
                    }
                  },
                  child: const Text('Generate'))
            ],
          )),
    );
  }

  String? errorFirstText() => _errorFirstText;

  String? errorSecondText() => _errorSecondText;

  bool _isValid(String em) {
    String validRegexp = '^[0-9]+\$';

    RegExp regExp = RegExp(validRegexp);

    return regExp.hasMatch(em);
  }

  int _generateRandom(int first, int second) {
    var _generator = Random();
//todo random not correct working
    int _result = 0;
    while (_result <= first-1 || _result == second) {
      _result = _generator.nextInt(++second);
    }
    return _result;
  }

  void _navigateToResultRouteAndGetResult(BuildContext context) async{
     int buffer = _generateRandom(firstValue ?? 0, secondValue ?? 0);
    result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultRoute(result: buffer))
    );
    setState(() {
      // just refresh the screen to display returned value
    });
  }
}
