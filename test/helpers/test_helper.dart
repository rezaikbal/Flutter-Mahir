


import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:movie_app/common/network.dart';
import 'package:movie_app/data/datasource/helper/movie_database_helper.dart';
import 'package:movie_app/data/datasource/helper/tv_database_helper.dart';
import 'package:movie_app/data/datasource/local/movie/local_data_source_movie.dart';
import 'package:movie_app/data/datasource/local/tv/local_data_source_tv.dart';
import 'package:movie_app/data/datasource/remote/remote_data_source.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';
import 'package:movie_app/domain/repository/tv_repository.dart';

@GenerateMocks([
  MovieRepository,
  TvRepository,
  RemoteDataSource,
  LocalDataSourceTv,
  LocalDataSourceMovie,
  TvDatabaseHelper,
  MovieDatabaseHelper,
  Network,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])


void main(){

}
