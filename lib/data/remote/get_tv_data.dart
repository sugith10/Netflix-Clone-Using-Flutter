import 'dart:developer';

import 'package:nutflix/domain/models/tv_show.dart';
import 'package:nutflix/services/tmdb_api_call.dart';

class TvData{

 ApiCall apiCall = ApiCall();

  final String _topRatedTvSeriesUrl =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=';
  final String _popularTvSeriesUrl =
      'https://api.themoviedb.org/3/tv/popular?api_key=';

  Future<List<TvShow>> _fetchTvData(String url)async{
   final result = await apiCall.getData(url);
    if(result.isNotEmpty){
      List<TvShow> movieDetails = result.map((dynamic item) {
        String tvPoster = apiCall.imageLink + item['poster_path'];
        String backDrop = apiCall.imageLink + item['poster_path'];
        return TvShow(
       tvShowName: item['original_name'],
       tvShowPoster: tvPoster,
       tvShowBackdrop: backDrop,
       tvShowOverview: item['overview'],
        );
      }).toList();

      return movieDetails;
    }
   log('somthing went wrong');
   return [];
  }

  Future<List<TvShow>> topRatedTvSeries()async{
    List<TvShow> topRatedTvSeries = await _fetchTvData(_topRatedTvSeriesUrl);
    return topRatedTvSeries;
  }
}