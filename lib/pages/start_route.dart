import 'package:flutter/material.dart';

import '../ui_helper/ui_helper.dart';
import '../app/constants.dart';

class StartRoute extends StatefulWidget {
  const StartRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartRoutState();
}

class StartRoutState extends State<StartRoute> {
  final _helper = UIHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate a number'),
      ),
      body: Center(
          child: SizedBox(
        width: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Previous result is: ${_helper.getResult()}'),
            const Divider(),
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 10,
              onChanged: (text) {
                setState(() {
                  _helper.cacheIfValid(text, firstValueSing);
                });
              },
              decoration: InputDecoration(
                  hintText: 'Input min. value',
                  errorText: _helper.errorFirstText()),
            ),
            const Divider(),
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 10,
              onChanged: (text) {
                setState(() {
                  _helper.cacheIfValid(text, secondValueSing);
                });
              },
              decoration: InputDecoration(
                  hintText: 'Input max. value',
                  errorText: _helper.errorSecondText()),
            ),
            const Divider(),
            ElevatedButton(
                onPressed: () async{
                  var result = await _helper.onGenerateButtonPressed(context);
                  if(result != null){
                    setState(() {
                    });
                  }
                },
                child: const Text('Generate'))
          ],
        ),
      )),
    );
  }
}
