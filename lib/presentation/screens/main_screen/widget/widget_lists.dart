
import 'package:flutter/material.dart';
import 'package:nutflix/controller/screen_actions_controller/screen_navigation_controller/screen_navigation/search_screen_navigation.dart';
import 'package:nutflix/presentation/screens/home_screen/home_scrn.dart';
import 'package:nutflix/presentation/screens/my_netflix_screen/my_netflix_scrn.dart';
import 'package:nutflix/presentation/screens/new_screen/new_and_hot_scrn.dart';
import 'package:nutflix/presentation/screens/search_screen/search_screen.dart';

class WidgetList {
  BuildContext context;

  WidgetList(this.context);

  final List<Widget> mainScreens = [
    const HomeScreen(),
    const NewAndHotScrn(),
    const MyNetflixScrn()
  ];

  final List<Widget> appbarTitle = [
    Image.asset(
      'assets/img/netflix_logo0.png',
      height: 35,
      width: 35,
    ),
    const Text(
      'New & Hot',
      style: TextStyle(fontWeight: FontWeight.w700),
    ),
    const Text(
      'My Netflix',
      style: TextStyle(fontWeight: FontWeight.w700),
    ),
  ];

  void navigateToSearchScreen() {
    ScreenNavigationCntrl().navigateToSearchScreen(context);
  }

  List<List<Widget>> get appbarActions => [
        [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.cast),
          ),
          GestureDetector(
            onTap: () {
              navigateToSearchScreen();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.search),
            ),
          ),
        ],
        [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.cast),
          ),
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.search),
            ),
            onTap: () => navigateToSearchScreen(),
          ),
        ],
        [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.cast),
          ),
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.search),
            ),
            onTap: () => navigateToSearchScreen(),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.density_medium),
          ),
        ],
      ];
}
