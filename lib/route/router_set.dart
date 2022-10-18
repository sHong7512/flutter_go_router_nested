import 'package:go_router/go_router.dart';

import '../model/number_item.dart';
import '../screen/bottom_nav_screen.dart';
import '../screen/basic/basic_clicked_screen.dart';
import '../screen/basic/basic_example_screen.dart';
import '../screen/number/number_detail_screen.dart';
import '../screen/number/number_tab_manage_screen.dart';
import '../screen/redirect/rediret_screen.dart';
import 'page_builders.dart';

final List<NumberItem> numberItems = List.generate(
    100, (index) => NumberItem(id: index, name: 'number item $index'));

class RouterSet{
  GoRouter get goRouterSet => GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        redirect: (_, __) => '/number',
      ),
      ..._numberRoute(),
      ..._basicRoute(),
      ..._redirectRoute(),
    ],
  );

  List<GoRoute> _numberRoute(){
    return <GoRoute>[
      GoRoute(
        path: '/number',
        redirect: (_, __) => '/number/jjack',
      ),
      GoRoute(
        path: '/number/:kind(jjack|hol|all)',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: BottomNavScreen(
              selectedTab: BottomNavTab.number,
              child: NumberTabManageScreen(kind: state.params['kind']!)),
        ),
        routes: [
          GoRoute(
            path: ':numberId',
            builder: (context, state) {
              final int numberId = int.parse(state.params['numberId'].toString());
              return NumberDetailScreen(numberItem: numberItems[numberId]);
            },
          )
        ],
      ),
    ];
  }

  List<GoRoute> _basicRoute(){
    return <GoRoute>[
      GoRoute(
        path: '/basic',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BottomNavScreen(
            selectedTab: BottomNavTab.basic,
            child: BasicExampleScreen(),
          ),
        ),
        routes: [
          GoRoute(
            path: ':kind(first|second|third)',
            builder: (contexst, state) =>
                BasicClickedScreen(kind: state.params['kind']!),
          ),
        ],
      )
    ];
  }

  List<GoRoute> _redirectRoute(){
    return <GoRoute>[
      GoRoute(
        path: '/redirect',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BottomNavScreen(
            selectedTab: BottomNavTab.redirect,
            child: RedirectScreen(),
          ),
        ),
      ),
      GoRoute(
        path: '/goSecond',
        redirect: (_, __) => '/basic/second',
      ),
      GoRoute(
        path: '/goNumber0',
        redirect: (_, __) => '/number/all/0',
      ),
    ];
  }
}
