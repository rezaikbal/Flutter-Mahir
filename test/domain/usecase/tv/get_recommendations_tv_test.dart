


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/usecase/tv/recommended_tv_usecase.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(){
  late RecommendedTvUsecase getRecommendationsTv;
  late MockTvRepository mockTvRepository;

  setUp((){
    mockTvRepository = MockTvRepository();
    getRecommendationsTv = RecommendedTvUsecase(mockTvRepository);
  });

  final tId = 1;
  final tv = <Tv>[];
  test('should get list of movie recommendations from the repository', () async {
    ///arrange
    when(mockTvRepository.getRecommendationsTv(tId)).thenAnswer((_) async => Right(tv));
    ///act
    final result = await getRecommendationsTv.execute(tId);
    ///assert
    expect(result, Right(tv));
  });
}