import 'package:api_movie_db/models/movie.dart';

abstract class MovieState {}

class MovieInitialState extends MovieState {}

class ListMovieState extends MovieState {

  final List<Movie> listMovie;
  ListMovieState({required this.listMovie});
}

class LoadingMovieState extends MovieState {}

class MovieMessageListEmptyState extends MovieState {

  final String message;
  MovieMessageListEmptyState({required this.message});
}

class MovieMessageErrorState extends MovieState {

  final String message;
  MovieMessageErrorState({required this.message});
}