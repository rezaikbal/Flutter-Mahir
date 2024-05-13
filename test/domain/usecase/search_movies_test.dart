



import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/domain/usecase/movie/search_movie_usecase.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  late SearchMovieUsecase searchMovies;
  late MockMovieRepository mockMovieRepository;

  setUp((){
    mockMovieRepository = MockMovieRepository();
    searchMovies = SearchMovieUsecase(mockMovieRepository);
  });

  final tMovies = <Movie>[];
  final tQuery = "Spiderman";
  test('should get list of movies from the repository', () async {
    ///arrange
    when(mockMovieRepository.searchMovies(tQuery)).thenAnswer((_) async => Right(tMovies));
    ///act
    final result = await searchMovies.execute(tQuery);
    ///assert
    expect(result, Right(tMovies));
  });

}