


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/domain/usecase/movie/now_playing_usecase.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  late NowPlayingUsecase usecase;
  late MockMovieRepository mockMovieRepository;

  setUp((){
    mockMovieRepository = MockMovieRepository();
    usecase = NowPlayingUsecase(mockMovieRepository);
  });

  final tMovies = <Movie>[];

  test('sould get list of movies from the repository', () async{
    ///arrange
    when(mockMovieRepository.getNowPlaying()).thenAnswer((_) async => Right(tMovies));
    ///act
    final result = await usecase.execute();
    ///assert
    expect(result, Right(tMovies));
  });
}