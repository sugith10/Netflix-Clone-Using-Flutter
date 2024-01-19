import 'package:flutter/material.dart';

class NewAndHotScrn extends StatelessWidget {
  const NewAndHotScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  height: 25,
                  color: Color.fromARGB(255, 228, 4, 4),
                ),
              );
            }));
  }
}
