import 'package:flutter/material.dart';
import 'package:study/app/app.dart';

class ResultRoute extends StatelessWidget {
  final int result;
  const ResultRoute({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     // final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
                "Your result is: $result"
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context, result);
                },
                child: const Text('Go back'))
          ],
        ),
      ),
    );
  }

}