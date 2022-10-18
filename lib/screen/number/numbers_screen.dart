import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../model/number_item.dart';

class NumbersScreen extends StatelessWidget {
  List<NumberItem?> numberItems;

  NumbersScreen({Key? key, required this.numberItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return item(context, numberItems[index]);
    });
  }

  Widget item(BuildContext context, NumberItem? numberItem) {
    if (numberItem == null) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          GoRouter.of(context).go('/number/all/${numberItem.id}');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('ID ${numberItem.id}'),
            Text(numberItem.name),
          ],
        ),
      ),
    );
  }
}
