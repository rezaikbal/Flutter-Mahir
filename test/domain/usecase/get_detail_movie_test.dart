



import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/usecase/movie/detail_movie_usecase.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main(){
  late DetailMovieUsecase getMovieDetail;
  late MockMovieRepository mockMovieRepository;

  setUp((){
    mockMovieRepository = MockMovieRepository();
    getMovieDetail = DetailMovieUsecase(mockMovieRepository);
  });

  final tId = 1;
  test('should get movie detail from the repository', () async {
    ///arrange
    when(mockMovieRepository.getDetailMovie(tId))
        .thenAnswer((_) async => Right(testMovieDetail));
    ///act
    final result = await getMovieDetail.execute(tId);
    ///assert
    expect(result, Right(testMovieDetail));
  });
}