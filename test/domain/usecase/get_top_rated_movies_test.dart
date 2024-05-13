


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/domain/usecase/movie/top_rated_movie_usecase.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){

  late TopRatedMovieUsecase getTopRatedMovies;
  late MockMovieRepository mockMovieRepository;

  setUp((){
    mockMovieRepository = MockMovieRepository();
    getTopRatedMovies = TopRatedMovieUsecase(mockMovieRepository);
  });

  final tMovies = <Movie>[];


  test('should get list of movies from repository', () async {
    ///arrange
    when(mockMovieRepository.getTopRatedMovies()).thenAnswer((_) async => Right(tMovies));
    ///act
    final result = await getTopRatedMovies.execute();
    ///assert
    expect(result, Right(tMovies));
  });
}