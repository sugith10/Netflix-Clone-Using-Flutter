import 'package:flutter/material.dart';
import 'package:new_netflix/screen/home_screen/widgets/personal_category.dart';
import 'package:new_netflix/screen/home_screen/widgets/play.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                      'http://www.impawards.com/tv/posters/naruto.jpg'),
                ),
                Positioned(
                  top: 480,
                  left: 5,
                  right: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlayButton(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        textColor: const Color.fromRGBO(0, 0, 0, 1),
                        text: 'Play',
                        icon: Icons.play_arrow,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: PlayButton(
                          color: Colors.grey.withOpacity(0.4),
                          textColor: const Color.fromRGBO(255, 255, 255, 1),
                          text: 'My List',
                          icon: Icons.check,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
