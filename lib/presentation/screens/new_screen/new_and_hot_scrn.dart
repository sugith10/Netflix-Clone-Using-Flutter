import 'package:flutter/material.dart';

class NewAndHotScrn extends StatelessWidget {
  const NewAndHotScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text('hello wordl'),
        Expanded(
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: 300,
                    color: Colors.green,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 50,
                          child: Column(
                            children: [Text('Feb'), Text('14')],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Stack(
                            //   children: [
                            //     Image.network(
                            //       'http://www.impawards.com/tv/posters/naruto.jpg',
                            //       width: double.infinity,
                            //       height: 100,
                            //     ),
                            //   ],
                            // ),
                            Text('data',
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                            Text(
                                'shfsjfshfhdksfhskdfasjsalkshksakjsdaldsahklasjdsjalkdajldjlhdaljdskjdlkh',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    ));
  }
}
