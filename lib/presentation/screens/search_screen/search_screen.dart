import 'package:flutter/material.dart';
import 'package:nutflix/controller/api_controller/get_movie_data.dart';
import 'package:nutflix/model/movie.dart';
import 'package:nutflix/presentation/screens/search_screen/widget/search_reaults_tile_widget.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchContent = '';
  List<Movie> searchResults = [];

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
            child:  Row(
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
                    onChanged: (value) {
                      _searchMovies(value);
                    },
                    autofocus: true,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Search games, shows, movies...',
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
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
            future: Future.value(searchResults),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                return const Center(
                  child: Text('No search results'),
                );
              } else {
                List<Movie> searchResults = snapshot.data as List<Movie>;
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return SearchResultsTile(
                        movie: searchResults[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemCount: searchResults.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _searchMovies(String value) async {
    try {
      List<Movie> results = await MovieData().getTrendingMovies();
      setState(() {
        searchResults = results;
      });
    } catch (e) {
      print('Error searching movies: $e');
    }
  }
}
