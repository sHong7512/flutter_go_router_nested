import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../route/router_set.dart';
import 'numbers_screen.dart';

class NumberTabManageScreen extends StatefulWidget {
  NumberTabManageScreen({
    Key? key,
    required this.kind,
  }) : super(key: key);

  final String kind;

  @override
  State<NumberTabManageScreen> createState() => _NumberTabManageScreenState();
}

class _NumberTabManageScreenState extends State<NumberTabManageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _checkKind();
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Tab Screen'),
        bottom: TabBar(
          controller: _tabController,
          onTap: _handleTabTapped,
          tabs: const <Tab>[
            Tab(
              text: '짝수',
              icon: Icon(Icons.numbers),
            ),
            Tab(
              text: '홀수',
              icon: Icon(Icons.numbers),
            ),
            Tab(
              text: 'All',
              icon: Icon(Icons.format_list_numbered),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          NumbersScreen(
            numberItems: numberItems.map(
              (e) {
                if (e.id % 2 == 0) {
                  return e;
                }
              },
            ).toList(),
          ),
          NumbersScreen(
            numberItems: numberItems.map(
              (e) {
                if (e.id % 2 == 1) {
                  return e;
                }
              },
            ).toList(),
          ),
          NumbersScreen(
            numberItems: numberItems,
          ),
        ],
      ),
    );
  }

  _handleTabTapped(int index) {
    switch (index) {
      case 0:
        context.go('/number/jjack');
        break;
      case 1:
        context.go('/number/hol');
        break;
      case 2:
        context.go('/number/all');
        break;
      default:
        log('No Exist Index Error!');
        break;
    }
  }

  _checkKind(){
    print('kind : ${widget.kind}');

    switch (widget.kind) {
      case 'jjack':
        _tabController.index = 0;
        break;
      case 'hol':
        _tabController.index = 1;
        break;
      case 'all':
        _tabController.index = 2;
        break;
    }
  }
}
