import 'package:flutter/material.dart';
import 'package:nutflix/controller/api_controller/get_movie_data.dart';
import 'package:nutflix/model/movie.dart';

import 'package:nutflix/presentation/screens/new_and_hot_screen/widget/new_items_widget.dart';

class NewAndHotScrn extends StatelessWidget {

  const NewAndHotScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Column(
        children: [
            Container(
          height: 50,
          child: Center(
            child: Text('Fixed Widget'),
          ),
        ),
        const SizedBox(
          height: 20, 
        ),
          FutureBuilder(
              future: MovieData().getTrendingMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Center(
                      child: Text('No data available'),
                    ),
                  );
                } else {
                  List<Movie> movie = snapshot.data!;
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          
                          return NewItemsWidget(movie: movie[index],);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: movie.length),
                  );
                }
              }),
        ],
      )
    );
  }
}
