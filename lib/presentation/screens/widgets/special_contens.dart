import 'package:flutter/material.dart';
import 'package:nutflix/controller/get_movie_data.dart';
import 'package:nutflix/model/movie.dart';
import 'package:nutflix/presentation/screens/home_screen/widget/personal_category.dart';

class SpecialContents extends StatelessWidget {
  final String title;
  const SpecialContents({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PersonalCategoryTitle(
                title: title,
              ),
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<List<Movie>>(
        future: MovieData().getTrendingMovies() ,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Show a loading indicator while waiting for data.
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            List<Movie> movie = snapshot.data!;
            return PageView.builder(
              itemCount: movie.length,
              padEnds: false,
              controller: PageController(
                viewportFraction: 0.5,
                // initialPage: 1,
              ),
              itemBuilder: (context, index) {
                Movie movieDetails = movie[index];
                String poster = movieDetails.moviePoster;
                return Container(
                  margin: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(poster, fit: BoxFit.cover)),
                );
              },
            );
          }
        },
          ),
        ),
      ],
    )
;
  }
}