import 'dart:async';

import 'package:comidas/helpers/debouncer.dart';
import 'package:comidas/models/models.dart';
import 'package:comidas/models/search_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '0e036c36f86592f741ec182fd1a1fbff';
  final String _language = 'es-Es';
  List<Cast> cast = [];

  List<Movie> onDisplayMovies = [];
  List<Movie> onDisplayPopularMovies = [];
  Map<int, List<Cast>> onDisplayCast = {};

  int _popularPage = 0;
  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );
  final StreamController<List<Movie>> _suggestionsStreamController = StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => _suggestionsStreamController.stream;

  MoviesProvider(){
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _responseJsonData(String filter, int pages) async {
    final dynamic url;
    final dynamic response;

    if (pages != 0){
      url = Uri.https(_baseUrl, '3/movie/$filter', {
        'api_key': _apiKey,
        'language': _language,
        'page': '$pages',
      });
      
    } else {
      url = Uri.https(_baseUrl, '3/movie/$filter', {
        'api_key': _apiKey,
        'language': _language,
      });
    }
    response = await http.get(url); 
    
    return response.body;
  }
  Future<List<Movie>> responseJsonDataSearch(String query) async{
    final url = Uri.https(_baseUrl, '3/search/movie', {
        'api_key': _apiKey,
        'language': _language,
        'query': query,
      });

      final  response = await http.get(url);

    return SearchResponse.fromRawJson(response.body).results;
  }

  getOnDisplayMovies() async{
    onDisplayMovies = NowPlayingResponse.fromRawJson(await _responseJsonData('now_playing', 1)).results;
    notifyListeners();
  }

  getPopularMovies() async{
    _popularPage++;
    onDisplayPopularMovies = [...onDisplayPopularMovies, ...PopularResponse.fromRawJson(await _responseJsonData('popular', _popularPage)).results];
    notifyListeners();
  }

  Future<List<Cast>> getCast(int movieId) async{
    cast = [...CastProvider.fromRawJson(await _responseJsonData('$movieId/credits', 0)).cast];
    onDisplayCast[movieId] = cast;
    print(cast[0].id);
    return cast;
  }


  void getSuggestionByQuery(String query){
    debouncer.value = "";
    debouncer.onValue = (value) async {
      final results = await responseJsonDataSearch(query);
      _suggestionsStreamController.add(results);
    };

    final timer = Timer.periodic(debouncer.duration, (_) {
      debouncer.value = query;
     });

     Future.delayed(const Duration(milliseconds: 501)).then((value) => timer.cancel());
  }

  
}