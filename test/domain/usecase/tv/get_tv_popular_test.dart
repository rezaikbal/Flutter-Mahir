


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/usecase/tv/popular_tv_usecase.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(){
  late PopularTvUsecase getTvPopular;
  late MockTvRepository mockTvRepository;
  setUp((){
    mockTvRepository = MockTvRepository();
    getTvPopular = PopularTvUsecase(mockTvRepository);
  });

  final tv = <Tv>[];
  group('Get Popular TV Series', (){
    test('should get list of tv from the repository when execute function is called', () async{
      ///arrange
      when(mockTvRepository.getTvPopular()).thenAnswer((_) async=> Right(tv));
      ///act
      final result = await getTvPopular.execute();
      ///assert
      expect(result, Right(tv));
    });
  });
}