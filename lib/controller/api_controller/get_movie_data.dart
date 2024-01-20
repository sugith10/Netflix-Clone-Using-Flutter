import 'dart:developer';
import 'package:nutflix/model/movie.dart';
import 'package:nutflix/services/tmdb_api_call.dart';

class MovieData {
  ApiCall apiCall = ApiCall();

  final String trendingMoviesUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=';
  final String topRatedMoviesUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=';
  final String nowPlayingMoviesUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=';
  final String upComingMoviesUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=';

  Future<List<Movie>> _fetchMovieData(String url) async {
    final result = await apiCall.getData(url);
    if (result.isNotEmpty) {
      List<Movie> movieDetails = result.map((dynamic item) {
        String moviePoster = apiCall.imageLink + item['poster_path'];
        String backDrop = apiCall.imageLink + item['backdrop_path'];
        return Movie(
          movieName: item['original_title'],
          moviePoster: moviePoster,
          movieBackdrop: backDrop,
          movieOverview: item['overview'],
        );
      }).toList();

      return movieDetails;
    }
    log('somthing went wrong');
    return [];
  }

  Future<List<Movie>> getTrendingMovies() async {
    List<Movie> trendingMovies = await _fetchMovieData(trendingMoviesUrl);
    return trendingMovies;
  }

  Future<List<Movie>> getTopRatedMovies() async {
    return await _fetchMovieData(topRatedMoviesUrl);
  }

  Future<List<Movie>> getNowPlayingMovies() async {
    return await _fetchMovieData(nowPlayingMoviesUrl);
  }

  Future<List<Movie>> getUpcomingMovies() async {
    return await _fetchMovieData(upComingMoviesUrl);
  }
}
