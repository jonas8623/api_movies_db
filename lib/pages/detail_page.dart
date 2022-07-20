import 'package:api_movie_db/models/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../util/api_utilitie.dart';

class DetailPage extends StatelessWidget {

  final Movie movie;
  const DetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: const EdgeInsets.only(top: 14.0, left: 14.0, right: 14.0), child: Text(
                movie.title.toString(),
                style: const TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 400,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: ApiUtil.requestImg(movie.backdropPath!),
                  placeholderFadeInDuration: const Duration(seconds: 8),
                  placeholder: (_, url) => Image.asset(
                    'assets/logo_filmes.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Sinopse: ',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 12.0,),
              Row(
                children: [
                  SizedBox(
                    height: 200,
                    width: 160,
                    child: Hero(
                      tag: movie.id.toString(),
                      transitionOnUserGestures: true,
                      child: CachedNetworkImage(
                        imageUrl: ApiUtil.requestImg(movie.posterPath!),
                        placeholderFadeInDuration: const Duration(seconds: 8),
                        placeholder: (_, url) => Image.asset(
                          'assets/logo_filmes.png',
                          fit: BoxFit.cover,
                          width: 134,
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(movie.overview.toString()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Média de Votos: ' + movie.voteAverage.toString(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
