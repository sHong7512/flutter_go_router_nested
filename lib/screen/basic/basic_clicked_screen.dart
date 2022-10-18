import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasicClickedScreen extends StatelessWidget {
  String kind;
  BasicClickedScreen({Key? key, required this.kind}) : super(key: key);

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
