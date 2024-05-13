

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/usecase/movie/watchlist_movie_status_usecase.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  late WatchlistMovieStatusUsecase getWatchListStatus;
  late MockMovieRepository mockMovieRepository;

  setUp((){
    mockMovieRepository = MockMovieRepository();
    getWatchListStatus = WatchlistMovieStatusUsecase(mockMovieRepository);
  });

  test('should get watchlist status from repository', () async {
    ///arrange
    when(mockMovieRepository.isAddedToWatchlist(1)).thenAnswer((_) async => true);
    ///act
    final result = await getWatchListStatus.execute(1);
    ///assert
    expect(result, true);
  });

}