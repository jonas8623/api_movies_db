import 'package:api_movie_db/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieBloc>(
      create: (context) => MovieBloc(),
      child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(),
              home: const HomePage(),
      ),
    );
  }
}

