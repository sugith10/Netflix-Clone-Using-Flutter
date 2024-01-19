import 'package:flutter/material.dart';
import 'package:nutflix/presentation/screens/home_screen/widget/personal_category.dart';
import 'package:nutflix/presentation/screens/home_screen/widget/wallpaper.dart';
import 'package:nutflix/presentation/screens/widgets/movie_contents.dart';
import 'package:nutflix/presentation/screens/widgets/special_contens.dart';
import 'package:nutflix/presentation/screens/widgets/tv_contents.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Wallpaper(),
          ),
          MovieContents(title: 'Latest Movies'),
          SizedBox(
            height: 25,
          ),
          TvContents(title: 'Tranding Tv Shows'),
          SizedBox(
            height: 25,
          ),
          SpecialContents(title:'Only on Netflix'),
        ],
      ),
    );
  }
}
