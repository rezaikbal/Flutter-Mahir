import 'package:movie_app/common/constant.dart';
import 'package:movie_app/common/exception.dart';
import 'package:movie_app/data/datasource/remote/remote_data_source.dart';
import 'package:movie_app/data/models/movie/movie_response_model.dart';
import 'package:movie_app/data/models/tv/tv_model.dart';
import 'package:movie_app/data/models/tv/tv_detail_model.dart';
import 'package:movie_app/data/models/movie/movie_model.dart';
import 'package:movie_app/data/models/movie/movie_detail_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:movie_app/data/models/tv/tv_response_model.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/movie?$API_KEY&query=$query'));
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).listMovie;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> searchTv(String query) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query'));
    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).listTv;
    } else {
      throw ServerException();
    }
  }

  ///get now playing
  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=cd45fc4a5ba70bca58dff50e93884d4f'));
    print("yeye ${json.decode(response.body)} ");
    if (response.statusCode == 200) {
      print("${response.body} yeyey");
      return MovieResponse.fromJson(json.decode(response.body)).listMovie;
    } else {
      print("${response.body} yeyey");
      throw ServerException();
    }
  }

  ///get detail movie
  @override
  Future<MovieDetailModel> getDetailMovie(int id) async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/$id?$API_KEY'));
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvDetailModel> getDetailTv(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));
    if (response.statusCode == 200) {
      return TvDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  ///get recommendations movie
  @override
  Future<List<MovieModel>> getMovieRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/movie/$id/recommendations?$API_KEY'));
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).listMovie;
    }
    throw ServerException();
  }

  @override
  Future<List<TvModel>> getTvRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY'));
    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).listTv;
    }
    throw ServerException();
  }

  /// Get Movies popular
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/popular?$API_KEY'));
    if (response.statusCode == 200) {
      print(response.body);
      return MovieResponse.fromJson(json.decode(response.body)).listMovie;
    } else {
      throw ServerException();
    }
  }

  /// Get Movies Top Rated
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/movie/top_rated?$API_KEY'));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body)).listMovie;
    } else {
      throw ServerException();
    }
  }

  /// Get Tv Airing Today
  @override
  Future<List<TvModel>> getTvAiringToday() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/airing_today?$API_KEY'));

    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).listTv;
    } else {
      throw ServerException();
    }
  }

  ///
  @override
  Future<List<TvModel>> getTvOnTheAir() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY'));
    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).listTv;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getTvPopular() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY'));
    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).listTv;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvModel>> getTvTopRated() async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY'));
    if (response.statusCode == 200) {
      return TvResponse.fromJson(json.decode(response.body)).listTv;
    } else {
      throw ServerException();
    }
  }
}
