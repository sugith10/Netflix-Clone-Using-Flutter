import 'package:nutflix/model/search.dart';
import 'package:nutflix/services/tmdb_api_call.dart';

class Search{
  ApiCall apiCall = ApiCall();

   Future<List<SearchMovie>> search(value) async  {
    return apiCall.search(value);
   }
}