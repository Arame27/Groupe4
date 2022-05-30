import 'package:clonenetflix/models/Movie.dart';
import 'package:clonenetflix/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DataRepository with ChangeNotifier{
  ApiService apiService = ApiService();
  final List<Movie> _popularMovieList = [];
  int _popularMovieIndex = 1;

  List<Movie> get popularMovieList => _popularMovieList;
  Future <void> getPopularMovieList() async{
    try{
      List<Movie> movies =
        await apiService.getPopularMovies(pageNumber: _popularMovieIndex);
      _popularMovieList.addAll(movies);
      _popularMovieIndex++;
      notifyListeners();
    }on Response catch(response){
      print("Erreur ${response.statusCode}");
      rethrow;
    }
  }

  Future <void> initData() async{
    await getPopularMovieList();
  }

  Future<Movie> getMovieDetails({required Movie movie}) async {
    try {
      //Recupere les infos Film
      Movie newMovie = await apiService.getMovie(movie: movie);
      return newMovie;
    } on Response catch (response) {
      print("Error: ${response.statusCode}");
      rethrow;
    }
  }




}