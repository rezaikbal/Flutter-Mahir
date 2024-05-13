


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/domain/usecase/movie/recommended_movie_usecase.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  late RecommendedMovieUsecase getMovieRecommendations;
  late MockMovieRepository mockMovieRepository;

  setUp((){
    mockMovieRepository = MockMovieRepository();
    getMovieRecommendations = RecommendedMovieUsecase(mockMovieRepository);
  });

  final tId = 1;
  final tMovies = <Movie>[];
  test('should get list of movie recommendations from the repository', () async {
        ///arrange
        when(mockMovieRepository.getMovieRecommendations(tId)).thenAnswer((_) async => Right(tMovies));
        ///act
        final result = await getMovieRecommendations.execute(tId);
        ///assert
        expect(result, Right(tMovies));
      });
}