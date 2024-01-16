import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCall {
  String apiKey = '8fd500dec7d3830c67ec5e565258e1a9';
  String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZmQ1MDBkZWM3ZDM4MzBjNjdlYzVlNTY1MjU4ZTFhOSIsInN1YiI6IjY1YTNmOWEzNTY5MGI1MTM3ZmIwNGIyNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Tx0A_zWJXHLsUHEAcsmy5hI81JxOE5X0NQOTsJDXPxs';

  List topRatedMovies = [];

   Future<void>  getRecommedMovies() async {
    print('function start');
    final url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
    final uri = Uri.parse(url);

    try {
      final response = await http.get(
        uri
       
      );

      if (response.statusCode == 200) {
        print('successfully fetched the data');
        final json = jsonDecode(response.body) as Map;
        final results = json['results'];
        topRatedMovies = results;
      } else {
        print('failed');
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
       if (e is http.ClientException) {
        print('ClientException: ${e.message}');
      }
    }
  }
}
