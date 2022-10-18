import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  Exception? error;

  ErrorScreen({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Error Screen'),),
      body: Center(
        child: Text('Route Error Occur :: $error'),
      ),
    );
  }
}
