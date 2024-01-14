import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: ListView.builder(itemCount: 20, itemBuilder: (context, index){
        return ListTile(
          title: Container(height: 25, color: Colors.amber,),
        );
      }));
    
  }
}