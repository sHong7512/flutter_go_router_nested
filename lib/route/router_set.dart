import 'package:go_router/go_router.dart';

import '../model/number_item.dart';
import '../screen/bottom_nav_screen.dart';
import '../screen/button/button_click_screen.dart';
import '../screen/button/button_screen.dart';
import '../screen/number/number_detail_screen.dart';
import '../screen/number/number_tab_manage_screen.dart';
import '../screen/setting/setting_screen.dart';
import 'page_builders.dart';

List<NumberItem> numberItems = List.generate(
    100, (index) => NumberItem(id: index, name: 'number item $index'));

late final GoRouter RouterSet = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      redirect: (_, __) => '/number',
    ),
    GoRoute(
      path: '/number',
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: BottomNavScreen(
          selectedTab: BottomNavTab.number,
          child: NumberTabManageScreen(),
        ),
      ),
      routes: [
        GoRoute(
          path: ':numberId',
          builder: (context, state) {
            final int numberId = int.parse(state.params['numberId'].toString());
            return NumberDetailScreen(numberItem: numberItems[numberId]);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/button',
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: BottomNavScreen(
          selectedTab: BottomNavTab.button,
          child: ButtonScreen(),
        ),
      ),
      routes: [
        GoRoute(
          path: ':kind(first|second|third)',
          builder: (contexst, state) =>
              ButtonClickScreen(kind: state.params['kind']!),
        ),
      ],
    ),
    GoRoute(
      path: '/setting',
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: BottomNavScreen(
          selectedTab: BottomNavTab.setting,
          child: SettingScreen(),
        ),
      ),
    ),
    GoRoute(
      path: '/goSecond',
      redirect: (_, __) => '/button/second',
    ),
  ],
);
