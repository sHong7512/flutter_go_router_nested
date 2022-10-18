import 'package:flutter/material.dart';

import 'route/router_set.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: RouterSet().goRouterSet,
    ),
  );
}