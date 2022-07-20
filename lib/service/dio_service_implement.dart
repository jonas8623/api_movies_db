import 'package:api_movie_db/service/service.dart';
import 'package:dio/dio.dart';

class DioServiceImplement implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMjE0ZTgwYzI2OGJiYjMxMzM3NThjNTY1NWE2ZWM1YSIsInN1YiI6IjYyMTU1MTYxODEzODMxMDA2ZTE0NTI1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.T--03Jyf5danaKU8VUUb5INEsMKxwAWrN_S_amglumA'
        },
      )
    );
  }



}