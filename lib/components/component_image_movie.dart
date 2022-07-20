import 'package:api_movie_db/models/movie.dart';
import 'package:api_movie_db/pages/detail_page.dart';
import 'package:api_movie_db/util/api_utilitie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ComponentImageMovie extends StatelessWidget {

  final Movie movie;
  const ComponentImageMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => DetailPage(movie: movie),
            fullscreenDialog: true,
          ),
        ),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  topLeft: Radius.circular(24),
                ),
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
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title!, style: Theme.of(context).textTheme.headline6,),
                      const SizedBox(height: 12,),
                      Text(movie.originalTitle.toString(), style: const TextStyle(fontSize: 16),),
                      const Spacer(),
                      Text('Popularidade: ' + movie.popularity.toString()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
