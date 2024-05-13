

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/usecase/movie/watchlist_movie_usecase.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main(){
  late WatchlistMovieUsecase getWatchlistMovies;
  late MockMovieRepository mockMovieRepository;

  setUp((){
    mockMovieRepository = MockMovieRepository();
    getWatchlistMovies = WatchlistMovieUsecase(mockMovieRepository);
  });

  test('should get list of movies from the repository', () async {
    ///arrange
    when(mockMovieRepository.getWatchlistMovies()).thenAnswer((_) async => Right(testMovieList));
    ///act
    final result = await getWatchlistMovies.execute();
    ///assert
    expect(result, Right(testMovieList));
  });
}