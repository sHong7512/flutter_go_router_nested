import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum BottomNavTab {
  number,
  button,
  setting,
}

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({
    Key? key,
    required this.selectedTab,
    required this.child,
  }) : super(key: key);

  final BottomNavTab selectedTab;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveNavigationScaffold(
        selectedIndex: selectedTab.index,
        body: child,
        onDestinationSelected: (int idx) {
          switch (BottomNavTab.values[idx]) {
            case BottomNavTab.number:
              context.go('/number');
              break;
            case BottomNavTab.button:
              context.go('/button');
              break;
            case BottomNavTab.setting:
              context.go('/setting');
              break;
          }
        },
        destinations: const <AdaptiveScaffoldDestination>[
          AdaptiveScaffoldDestination(
            title: 'Number',
            icon: Icons.tab,
          ),
          AdaptiveScaffoldDestination(
            title: 'Button',
            icon: Icons.text_snippet_rounded,
          ),
          AdaptiveScaffoldDestination(
            title: 'Setting',
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}
