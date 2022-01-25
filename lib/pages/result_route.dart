import 'package:flutter/material.dart';

class ResultRoute extends StatelessWidget {
  final int result;
  const ResultRoute({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
                '$result'
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text('Go back'))
          ],
        ),
      ),
    );
  }

}