



import 'package:movie_app/common/failure.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/usecase/movie/watchlist_movie_usecase.dart';
import 'package:movie_app/presentation/provider/movie/watchlist_movie_notifier.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'watchlist_movie_notifier_test.mocks.dart';

@GenerateMocks([
  WatchlistMovieUsecase
])
void main(){
  late WatchlistMovieNotifier provider;
  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late int listenerCallCount;

  setUp((){
    listenerCallCount = 0;
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    provider = WatchlistMovieNotifier(watchlistMovieUsecase: mockGetWatchlistMovies)..addListener(() {
      listenerCallCount += 1;
    });
  });

  test('should change movies data when data is gotten successfully', () async {
    ///arrange
    when(mockGetWatchlistMovies.execute()).thenAnswer((_) async => Right([testWatchlistMovie]));
    ///act
    await provider.fetchWatchlistMovies();
    ///assert
    expect(provider.watchlistState, RequestState.Success);
    expect(provider.watchlistMovie, [testWatchlistMovie]);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    ///arrange
    when(mockGetWatchlistMovies.execute()).thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
    ///act
    await provider.fetchWatchlistMovies();
    ///assert
    expect(provider.watchlistState, RequestState.Error);
    expect(provider.message, "Can't get data");
    expect(listenerCallCount, 2);
  });
}