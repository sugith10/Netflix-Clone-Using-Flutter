import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  TextEditingController searchCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_sharp),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.cast),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              color: const Color.fromARGB(255, 46, 46, 46),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchCntrl,
                      autofocus: true,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          hintText: 'Search games, shows, movies...',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20, left: 10),
                    child: Icon(
                      Icons.mic_none_outlined,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
