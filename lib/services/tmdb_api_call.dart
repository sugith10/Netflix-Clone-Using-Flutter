import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:nutflix/model/search.dart';

class ApiCall {
 final String _apiKey = '8fd500dec7d3830c67ec5e565258e1a9';
 final String imageLink = 'https://image.tmdb.org/t/p/original';

  Future<List> getData(String url)async{
    final uri = Uri.parse(url+_apiKey);
    try{
      final response = await http.get(uri);

      if(response.statusCode == 200 ){
        log('successfully fetched the data');
            final json = jsonDecode(response.body);
            final results = json['results'] as List<dynamic>;
            return results;
      }else{
            print('status code: ${response.statusCode}');
      }
    }catch(e){
      log('failed when trying to fetch data');
      print(e);
    }
    return [];
  }

  Future<List<SearchMovie>> search(value) async { 
  final searchsUrl = 'https://api.themoviedb.org/3/search/movie?query=$value&include_adult=false&language=en-US&api_key=$_apiKey';
  final response = await http.get(Uri.parse(searchsUrl));
  if (response.statusCode == 200) {
    final decodedData = json.decode(response.body)['results'] as List;
    return decodedData
        .map((movie) => SearchMovie.fromJson(movie))
        // ignore: unnecessary_null_comparison
        .where((movie) => movie.posterPath != null && movie.posterPath.isNotEmpty)
        .toList();
  } else {
    throw Exception('Something Happened');
  }
}

}


  