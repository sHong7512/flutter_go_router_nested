import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/button/first');
              },
              child: Text('go First'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/button/second');
              },
              child: Text('go Second'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go("/button/third");
                // context.go('/button/third'); 와 같음
              },
              child: Text('go Third'),
            ),
          ],
        ),
      ),
    );
  }
}
