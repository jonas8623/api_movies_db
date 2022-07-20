import 'package:api_movie_db/bloc/movie_event_bloc.dart';
import 'package:api_movie_db/bloc/movie_state_bloc.dart';
import 'package:api_movie_db/models/movie.dart';
import 'package:bloc/bloc.dart';

import '../repositories/repositories.dart';


class MovieBloc extends Bloc<MovieEvent, MovieState> {


  final MovieRepository _movieRepository = MovieRepositoryImp();

  MovieBloc() : super(MovieInitialState()) {

    on<MovieInitialEvent>((event, emit) => emit(MovieInitialState()));
    on<LoadMovieEvent>((event, emit) => _mapToStateFetchAll(event, emit));
  }

  Future<void> _mapToStateFetchAll(LoadMovieEvent event, Emitter<MovieState> emit) async {

    emit(LoadingMovieState());

    try {
      List<Movie> listMovies = await _movieRepository.getMovies();

      if (listMovies.isEmpty) {
        emit(MovieMessageListEmptyState(message: 'A lista está vazia'));
      } else {
          emit(ListMovieState(listMovie: listMovies));
      }
    } catch(error) {
      emit(MovieMessageErrorState(message: 'Erro ao carregar a lista: $error'));
    }
  }
}