import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum BottomNavTab {
  number,
  basic,
  redirect,
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
            case BottomNavTab.basic:
              context.go('/basic');
              break;
            case BottomNavTab.redirect:
              context.go('/redirect');
              break;
          }
        },
        destinations: const <AdaptiveScaffoldDestination>[
          AdaptiveScaffoldDestination(
            title: 'Number',
            icon: Icons.tab,
          ),
          AdaptiveScaffoldDestination(
            title: 'Basic',
            icon: Icons.text_snippet_rounded,
          ),
          AdaptiveScaffoldDestination(
            title: 'Redirect',
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}
