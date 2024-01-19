import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiCall {
 static String apiKey = '8fd500dec7d3830c67ec5e565258e1a9';
 static String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZmQ1MDBkZWM3ZDM4MzBjNjdlYzVlNTY1MjU4ZTFhOSIsInN1YiI6IjY1YTNmOWEzNTY5MGI1MTM3ZmIwNGIyNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Tx0A_zWJXHLsUHEAcsmy5hI81JxOE5X0NQOTsJDXPxs';

 static List topRatedMovies = [];
 static final dio = Dio();
 static Future<void> getRecommedMovies() async {
    print('function start');

    final url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        print('successfully fetched the data');
        // final json = jsonDecode(response.body) as Map;
        // final results = json['results'];
        // topRatedMovies = results;
      } else {
        print('failed');
        print('Status Code: ${response.statusCode}');
        // print('Response Body: ${response.body}');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      if (e is http.ClientException) {
        print('ClientException: ${e.message}');
      }
    }
    print('function end');
  }
}

class LastFmApiClient {
  final String apiKey = 'a011df810f7862091f0bb3edb76d1c60';
  final String baseUrl = 'http://ws.audioscrobbler.com/2.0/';

  

  Future<void> getTopAlbums() async {
    const method = 'chart.getTopArtists';
    const limit = '10';

    final url = '$baseUrl?method=$method&api_key=$apiKey&limit=$limit&format=json';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print('success');
        print(response.body);
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> albums = data['albums']['album'];

        for (final album in albums) {
          final String albumName = album['name'];
          final String artistName = album['artist']['name'];

          print('Album: $albumName, Artist: $artistName');
        }
      } else {
        print('Failed to get top albums. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}