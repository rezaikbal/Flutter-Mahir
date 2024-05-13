


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/usecase/tv/remove_watchlist_tv_usecase.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main(){
  late RemoveWatchlistTvUsecase removeWatchlistTv;
  late MockTvRepository mockTvRepository;

  setUp((){
    mockTvRepository = MockTvRepository();
    removeWatchlistTv = RemoveWatchlistTvUsecase(mockTvRepository);
  });

  test('should remove watchlist movie from repository', () async {
    ///arrange
    when(mockTvRepository.removeWatchlistTv(testTvDetail)).thenAnswer((_) async => Right('Removed from watchlist'));
    ///act
    final result = await removeWatchlistTv.execute(testTvDetail);
    ///assert
    verify(mockTvRepository.removeWatchlistTv(testTvDetail));
    expect(result, Right('Removed from watchlist'));
  });

}