


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/usecase/tv/search_tv_usecase.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(){
  late SearchTvUsecase searchTv;
  late MockTvRepository mockTvRepository;

  setUp((){
    mockTvRepository = MockTvRepository();
    searchTv = SearchTvUsecase(mockTvRepository);
  });

  final tv = <Tv>[];
  final tQuery = "Spiderman";
  test('should get list of movies from the repository', () async {
    ///arrange
    when(mockTvRepository.searchTv(tQuery)).thenAnswer((_) async => Right(tv));
    ///act
    final result = await searchTv.execute(tQuery);
    ///assert
    expect(result, Right(tv));
  });

}