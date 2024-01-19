import 'package:flutter/material.dart';
import 'package:nutflix/presentation/screens/home_screen/widget/play.dart';

class Wallpaper extends StatelessWidget {
  const Wallpaper({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            );
  }
}