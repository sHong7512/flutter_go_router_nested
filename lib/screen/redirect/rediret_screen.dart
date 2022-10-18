import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RedirectScreen extends StatelessWidget {
  const RedirectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redirect'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/goSecond');
              },
              child: Text('Go basic second redirect'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/goNumber0');
              },
              child: Text('Go number0 redirect'),
            ),
          ],
        ),
      ),
    );
  }
}
