import 'package:Netflix/screen/search_screen/search_screen.dart';
import 'package:flutter/material.dart';

class MainScrnUtil{
  static void navigateToSearchScreen( BuildContext ctx) {
    Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => SearchScreen()));
  }
}