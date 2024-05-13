import 'package:movie_app/data/models/tv/tv_table.dart';

abstract class LocalDataSourceTv {
  Future<String> insertWatchlistTv(TvTable tvTable);
  Future<String> removeWatchlistTv(TvTable tvTable);
  Future<TvTable?> getTvById(int id);
  Future<List<TvTable>> getWatchlistTv();
}
