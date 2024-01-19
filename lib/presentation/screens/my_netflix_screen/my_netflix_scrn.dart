import 'package:flutter/material.dart';

class MyNetflixScrn extends StatelessWidget {
  const MyNetflixScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: 25 ,itemBuilder: (context, index){
        return ListTile(
          title: Container(height: 25, color: Colors.blueAccent,),
        );
      }));
  }
}