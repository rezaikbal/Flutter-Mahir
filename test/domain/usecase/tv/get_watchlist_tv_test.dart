

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/usecase/tv/watchlist_tv_usecase.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main(){
  late WatchlistTvUsecase getWatchlistTv;
  late MockTvRepository mockTvRepository;

  setUp((){
    mockTvRepository = MockTvRepository();
    getWatchlistTv = WatchlistTvUsecase(mockTvRepository);
  });

  test('should get list of movies from the repository', () async {
    ///arrange
    when(mockTvRepository.getWatchlistTv()).thenAnswer((_) async => Right(testTvList));
    ///act
    final result = await getWatchlistTv.execute();
    ///assert
    expect(result, Right(testTvList));
  });
}