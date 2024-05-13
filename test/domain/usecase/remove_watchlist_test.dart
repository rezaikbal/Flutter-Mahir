



import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/usecase/movie/remove_watchlist_usecase.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main(){
  late RemoveWatchlistUsecase removeWatchlist;
  late MockMovieRepository mockMovieRepository;

  setUp((){
    mockMovieRepository = MockMovieRepository();
    removeWatchlist = RemoveWatchlistUsecase(mockMovieRepository);
  });

  test('should remove watchlist movie from repository', () async {
    ///arrange
    when(mockMovieRepository.removeWatchlist(testMovieDetail)).thenAnswer((_) async => Right('Removed from watchlist'));
    ///act
    final result = await removeWatchlist.execute(testMovieDetail);
    ///assert
    verify(mockMovieRepository.removeWatchlist(testMovieDetail));
    expect(result, Right('Removed from watchlist'));
  });

}