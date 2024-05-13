


import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/usecase/tv/watchlist_status_tv_usecae.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(){
  late WatchlistStatusTvUsecase getWatchlistStatusTv;
  late MockTvRepository mockTvRepository;

  setUp((){
    mockTvRepository = MockTvRepository();
    getWatchlistStatusTv = WatchlistStatusTvUsecase(mockTvRepository);
  });

  test('should get watchlist status from repository', () async {
    ///arrange
    when(mockTvRepository.isAddedToWatchlistTv(1)).thenAnswer((_) async => true);
    ///act
    final result = await getWatchlistStatusTv.execute(1);
    ///assert
    expect(result, true);
  });
}