import 'dart:async';
import 'package:Netflix/screen/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,
    duration: const Duration(seconds: 3)
    );

    animationController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      animationController.stop();
    });
  }

  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () { 
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/json/netflix_logo.json',
              controller: animationController,
              onLoaded: (composition){
              animationController.duration = composition.duration;
              }
            ),
          ),
        ],
      ),
    );
  }
}
