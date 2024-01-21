import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiCall {
 final String _apiKey = '8fd500dec7d3830c67ec5e565258e1a9';
 final String imageLink = 'https://image.tmdb.org/t/p/original';

  Future<List> getData(String url , {bool search = false})async{
    Uri uri = Uri.parse(url+_apiKey);
    if(search){
      uri = Uri.parse(url);
    }
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

  Future<List> search(String value, ) async { 
  final searchsUrl = 'https://api.themoviedb.org/3/search/movie?query=$value&include_adult=false&language=en-US&api_key=$_apiKey';
  log(searchsUrl );
  return getData(searchsUrl , search: true);
}

  Future<List> trailer(id) async{
    final searchUrl = 'https://api.themoviedb.org/3/movie/$id/videos?api_key=$_apiKey';
    return getData(searchUrl, search: true);
  }



}


  