import 'package:flutter/material.dart';
import 'package:nutflix/controller/screen_actions_controller/screen_navigation_controller/screen_transitions/right_to_left.dart';
import 'package:nutflix/presentation/screens/search_screen/search_screen.dart';

class ScreenNavigationCntrl{
  _navigateToSearchScreen(BuildContext context){
      Navigator.of(context).push(rightToLeft(SearchScreen()));
  }
  navigateToSearchScreen(BuildContext context){
    _navigateToSearchScreen(context);
  }
}
