import 'package:api_movie_db/bloc/bloc.dart';
import 'package:api_movie_db/components/component_image_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late MovieBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = MovieBloc();
    _bloc.add(LoadMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<MovieBloc, MovieState>(
          bloc: _bloc,
          builder: (context, state) {
             if (state is LoadingMovieState) {
               return const Center(child: CircularProgressIndicator(color: Colors.red),);
             } else if (state is ListMovieState) {
               final movieHomePage = state.listMovie;
               return Scaffold(
                 appBar: AppBar(
                   title: const Text(
                     'Filmes',
                     style: TextStyle(
                         fontFamily: "Shaimus Grunge",
                         color: Colors.grey,
                         fontSize: 28,
                         letterSpacing: 1.2
                     ),
                   ),
                 ),
                 drawer: const Drawer(),
                 body: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: SingleChildScrollView(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         ListView.separated(
                             physics: const NeverScrollableScrollPhysics(),
                             shrinkWrap: true,
                             itemCount: movieHomePage.length,
                             itemBuilder: (context, index) {
                                      return ComponentImageMovie(
                                          movie: movieHomePage[index]
                                      );
                             },
                              separatorBuilder: (_, __) => const Divider(),
                         ),
                       ],
                     ),
                   ),
                 ),
               );
             }
             return Container();
           });
  }
}

