import 'package:flutter/material.dart';
import 'package:nutflix/controller/api_controller/get_movie_data.dart';
import 'package:nutflix/model/movie.dart';
import 'package:nutflix/presentation/screens/new_and_hot_screen/widget/new_items_widget.dart';
import 'package:nutflix/presentation/screens/search_screen/widget/search_reaults_tile_widget.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchContent = '';

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
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      // controller: searchContent,
                      autofocus: true,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          hintText: 'Search games, shows, movies...',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 10),
                    child: Icon(
                      Icons.mic_none_outlined,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
           
            FutureBuilder(
                future: MovieData().getTrendingMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SizedBox.shrink(),
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
                            return SearchResultsTile(
                              movie: movie[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 5,
                              ),
                          itemCount: movie.length),
                    );
                  }
                })
          ],
        ));
  }
}
