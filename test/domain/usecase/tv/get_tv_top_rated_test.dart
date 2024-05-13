


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/usecase/tv/top_rated_tv_usecase.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(){
  late TopRatedTvUsecase getTvTopRated;
  late MockTvRepository mockTvRepository;

  setUp((){
    mockTvRepository = MockTvRepository();
    getTvTopRated = TopRatedTvUsecase(mockTvRepository);
  });
  final tv = <Tv>[];
  test('should get list of movies from repository', () async{
    ///arrange
    when(mockTvRepository.getTvTopRated()).thenAnswer((_) async=> Right(tv));
    ///act
    final result = await getTvTopRated.execute();
    ///assert
    expect(result, Right(tv));
  });
}