import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:api_movie_db/models/movie.dart';
import 'package:api_movie_db/util/api_utilitie.dart';
import 'package:http/http.dart' as http;

abstract class MovieRepository {

  Future<List<Movie>> getMovies();
}

class MovieRepositoryImp extends MovieRepository {

  @override
  Future<List<Movie>> getMovies() async {

    final response = await http.Client().get(
        Uri.parse('https://api.themoviedb.org/4/' + ApiUtil.requestMovieList),
        headers: {
          HttpHeaders.authorizationHeader : 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMjE0ZTgwYzI2OGJiYjMxMzM3NThjNTY1NWE2ZWM1YSIsInN1YiI6IjYyMTU1MTYxODEzODMxMDA2ZTE0NTI1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.T--03Jyf5danaKU8VUUb5INEsMKxwAWrN_S_amglumA'
        });
    if (response.statusCode == 200) {
      //log(response.body);
      List movieList = json.decode(response.body)['results'];
      return movieList.map((e) => Movie.fromJson(e)).toList();
    } else {
      log(response.statusCode.toString());
      throw Exception('Falha');
    }
  }

}