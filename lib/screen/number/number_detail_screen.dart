import 'package:flutter/material.dart';
import '../../model/number_item.dart';

class NumberDetailScreen extends StatelessWidget {
  final NumberItem numberItem;

  NumberDetailScreen({Key? key, required this.numberItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Number Detail'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID : ${numberItem.id}', style: TextStyle(fontSize: 30),),
            SizedBox(height: 20,),
            Text('Name : ${numberItem.name}', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
