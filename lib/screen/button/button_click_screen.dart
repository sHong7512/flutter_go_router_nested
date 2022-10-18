import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonClickScreen extends StatelessWidget {
  String kind;
  ButtonClickScreen({Key? key, required this.kind}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$kind Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: Text('pop!'),
        ),
      ),
    );
  }
}
