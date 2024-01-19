import 'package:flutter/material.dart';
import 'package:nutflix/presentation/screens/home_screen/widget/personal_category.dart';
import 'package:nutflix/presentation/screens/home_screen/widget/play.dart';
import 'package:nutflix/presentation/screens/home_screen/widget/wallpaper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Wallpaper(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PersonalCategoryTitle(
                  title: 'Because you watched Gatta Kusthi'),
              Container(
                color: Colors.white,
                height: 150,
              ),
            ],
          )
        ],
      ),
    );
  }
}
