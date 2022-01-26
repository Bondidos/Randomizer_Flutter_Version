import 'dart:math';

import 'package:flutter/services.dart';

import '../app/constants.dart';
import 'package:flutter/material.dart';
import 'package:study/pages/result_route.dart';

class UIHelper {
  int _firstValue = 0;
  int _secondValue = 0;
  String? _errorFirstText;
  String? _errorSecondText;
  int? _result;

  int? getResult() => _result;
  String? errorFirstText() => _errorFirstText;
  String? errorSecondText() => _errorSecondText;

  int _generateRandom(int first, int second) {
    var _generator = Random();
    int _result = _generator.nextInt(second - first + 1);
    return first + _result;
  }

  Future<int> _navigateToResultRouteAndGetResult(
      BuildContext context, int first, int second) async {
    int buffer = _generateRandom(first, second);
    return await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultRoute(result: buffer)))
        .then((value) => _result=value);
  }

  Widget _makeAlert(BuildContext context) {
    return AlertDialog(
      title: const Text('Wrong values. "first should be less then second" '),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('OK'))
      ],
    );
  }

  Future? onGenerateButtonPressed(BuildContext context) {
    if (_firstValue < _secondValue) {
       return _navigateToResultRouteAndGetResult(
          context, _firstValue, _secondValue);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => _makeAlert(context));
    }
    return null;
  }

  void cacheIfValid(String text, String sing) {
    if (_isValid(text) && (int.tryParse(text) ?? 0) <= maxInt) {
      var value = int.tryParse(text) ?? 0;
      _setErrorAndValues(sing, null, value);
    } else {
      _setErrorAndValues(sing, 'Not valid value', null);
    }
  }

  void _setErrorAndValues(String sing, String? error, int? value) {
    switch (sing) {
      case firstValueSing:
        _errorFirstText = error;
        (value != null) ? _firstValue = value : null;
        break;
      case secondValueSing:
        _errorSecondText = error;
        (value != null) ? _secondValue = value : null;
        break;
    }
  }

  bool _isValid(String em) {
    String validRegexp = '^[0-9]+\$';
    RegExp regExp = RegExp(validRegexp);
    return regExp.hasMatch(em);
  }
}
