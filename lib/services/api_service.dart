import 'package:clonenetflix/models/Movie.dart';
import 'package:clonenetflix/models/person.dart';
import 'package:clonenetflix/services/api.dart';
import 'package:dio/dio.dart';

class ApiService{
  final Api api = Api();
  final Dio dio = Dio();


  //path
  Future<Response> getData(String path,{Map<String , dynamic>?params})async{
    String url = api.baseUrl + path;
    Map<String,dynamic> query = {
      'api_key' : api.apiKey,
      'language' : 'fr-FR'
    };
    if(params != null){
      query.addAll(params);
    }
    final response = await dio.get(url,queryParameters: query);
    if (response.statusCode == 200){
      return response;
    }else{
      throw response;
    }
  }
  Future<List<Movie>> getPopularMovies({required int pageNumber}) async{

    Response response = await getData("movie/popular",params: {
      'page' : pageNumber
    });
    //print("ok");

    if (response.statusCode == 200){
      Map data = response.data;
      List<dynamic> results = data["results"];
      List<Movie> movies = [];
      for(dynamic json in results) {
        Movie movie = Movie.fromJson(json);
        movies.add(movie);
      }
      return movies;
    }else{
      throw response;
    }
  }

  Future<Movie> getMovie({required Movie movie}) async {
    Response response = await getData("/movie/${movie.id}", params: {
      'include_image_language': "null",
      'append_to_response': "videos,images,credits"
    });
    if (response.statusCode == 200) {
      Map data = response.data;
      //On recupere les genre
      var genres = data["genres"] as List;
      List<String> genreList =
      genres.map((genre) => genre['name'] as String).toList();
      //On recupere les videos
      List<String> videoKeys = data["videos"]["results"]
          .map<String>((dynamic videoJson) => videoJson['key'] as String)
          .toList();
      //On recupere les Photos
      List<String> images = data["images"]["backdrops"]
          .map<String>((dynamic imageJson) =>
          "${api.baseImageUrl}${imageJson['file_path']}")
          .toList();
      //On recupere le Casting
      List<Person> casting = data["credits"]["cast"]
          .map<Person>((dynamic personJson) => Person.fromJson(personJson))
          .toList();
      Movie newMovie = movie.copyWith(
          genres: genreList,
          releaseDate: data["release_date"],
          vote: data['vote_average'],
          videos: videoKeys,
          images: images,
          casting: casting);
      return newMovie;
    } else {
      throw response;
    }
  }



}