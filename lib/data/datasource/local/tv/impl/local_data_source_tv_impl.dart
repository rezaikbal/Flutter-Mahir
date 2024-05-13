import 'package:movie_app/common/exception.dart';
import 'package:movie_app/data/datasource/helper/tv_database_helper.dart';
import 'package:movie_app/data/datasource/local/tv/local_data_source_tv.dart';
import 'package:movie_app/data/models/tv/tv_table.dart';

class LocalDataSourceTvImpl implements LocalDataSourceTv {
  final TvDatabaseHelper tvDatabaseHelper;

  LocalDataSourceTvImpl({required this.tvDatabaseHelper});

  @override
  Future<TvTable?> getTvById(int id) async {
    final result = await tvDatabaseHelper.getTvById(id);
    if (result != null) {
      return TvTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TvTable>> getWatchlistTv() async {
    final result = await tvDatabaseHelper.getWatchlistTv();
    return result.map((e) => TvTable.fromMap(e)).toList();
  }

  @override
  Future<String> insertWatchlistTv(TvTable tvTable) async {
    try {
      await tvDatabaseHelper.insertWatchlistTv(tvTable);
      return 'Added to watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlistTv(TvTable tvTable) async {
    try {
      await tvDatabaseHelper.removeWatchList(tvTable);
      return 'Remove from watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
