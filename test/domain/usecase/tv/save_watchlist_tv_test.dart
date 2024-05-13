



import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/usecase/tv/save_watchlist_tv)usecase.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main(){
  late SaveWatchlistTvUsecase saveWatchlistTv;
  late MockTvRepository mockTvRepository;

  setUp((){
    mockTvRepository = MockTvRepository();
    saveWatchlistTv = SaveWatchlistTvUsecase(mockTvRepository);
  });
  test('should save tv to the repository', () async {
    ///arrange
    when(mockTvRepository.saveWatchlistTv(testTvDetail)).thenAnswer((_) async => Right('Added to Watchlist'));
    ///act
    final result = await saveWatchlistTv.execute(testTvDetail);
    ///assert
    verify(mockTvRepository.saveWatchlistTv(testTvDetail));
    expect(result, Right('Added to Watchlist'));
  });
}