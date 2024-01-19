
import 'package:flutter/material.dart';
import 'package:nutflix/presentation/screens/search_screen/search_screen.dart';


class MainScrnUtil{
  static void navigateToSearchScreen( BuildContext ctx) {
    Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => SearchScreen()));
  }
}