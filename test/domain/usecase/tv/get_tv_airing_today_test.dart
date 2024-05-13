



import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entitites/tv/tv.dart';
import 'package:movie_app/domain/usecase/tv/airing_today_usecase.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(){
  late AiringTvUsecase getTvAiringToday;
  late MockTvRepository mockTvRepository;
  setUp((){
    mockTvRepository = MockTvRepository();
    getTvAiringToday = AiringTvUsecase(mockTvRepository);
  });

  final tv = <Tv>[];
  group('Get Airing Today TV Series', (){
    test('should get list of tv from the repository when execute function is called', () async{
      ///arrange
      when(mockTvRepository.getTvAiringToday()).thenAnswer((_) async=> Right(tv));
      ///act
      final result = await getTvAiringToday.execute();
      ///assert
      expect(result, Right(tv));
    });
  });
}