import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasicExampleScreen extends StatelessWidget {
  const BasicExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/basic/first');
              },
              child: Text('push First'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/basic/second');
              },
              child: Text('push Second'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/basic/third');
                // context.go('/button/third'); 와 같음
              },
              child: Text('go Third'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/redirect');
                // context.go('/button/third'); 와 같음
              },
              child: Text('go Redirect Tab'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/number');
              },
              child: Text('go Number Tab'),
            ),
          ],
        ),
      ),
    );
  }
}
