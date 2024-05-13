

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/usecase/movie/save_watchlist_usecase.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main(){

  late SaveWatchlistUsecase saveWatchlist;
  late MockMovieRepository mockMovieRepository;

  setUp((){
    mockMovieRepository = MockMovieRepository();
    saveWatchlist = SaveWatchlistUsecase(mockMovieRepository);
  });
  test('should save movie to the repository', () async {
    ///arrange
    when(mockMovieRepository.saveWatchlist(testMovieDetail)).thenAnswer((_) async => Right('Added to Watchlist'));
    ///act
    final result = await saveWatchlist.execute(testMovieDetail);
    ///assert
    verify(mockMovieRepository.saveWatchlist(testMovieDetail));
    expect(result, Right('Added to Watchlist'));
  });

}