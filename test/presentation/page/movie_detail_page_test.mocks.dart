// Mocks generated by Mockito 5.4.4 from annotations
// in movie_app/test/presentation/page/movie_detail_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i12;
import 'dart:ui' as _i13;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i10;
import 'package:movie_app/common/state.dart' as _i9;
import 'package:movie_app/domain/entitites/movie/movie.dart' as _i11;
import 'package:movie_app/domain/entitites/movie/movie_detail.dart' as _i7;
import 'package:movie_app/domain/usecase/movie/detail_movie_usecase.dart'
    as _i2;
import 'package:movie_app/domain/usecase/movie/recommended_movie_usecase.dart'
    as _i3;
import 'package:movie_app/domain/usecase/movie/remove_watchlist_usecase.dart'
    as _i6;
import 'package:movie_app/domain/usecase/movie/save_watchlist_usecase.dart'
    as _i5;
import 'package:movie_app/domain/usecase/movie/watchlist_movie_status_usecase.dart'
    as _i4;
import 'package:movie_app/presentation/provider/movie/detail_movie_notifier.dart'
    as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDetailMovieUsecase_0 extends _i1.SmartFake
    implements _i2.DetailMovieUsecase {
  _FakeDetailMovieUsecase_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRecommendedMovieUsecase_1 extends _i1.SmartFake
    implements _i3.RecommendedMovieUsecase {
  _FakeRecommendedMovieUsecase_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWatchlistMovieStatusUsecase_2 extends _i1.SmartFake
    implements _i4.WatchlistMovieStatusUsecase {
  _FakeWatchlistMovieStatusUsecase_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSaveWatchlistUsecase_3 extends _i1.SmartFake
    implements _i5.SaveWatchlistUsecase {
  _FakeSaveWatchlistUsecase_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRemoveWatchlistUsecase_4 extends _i1.SmartFake
    implements _i6.RemoveWatchlistUsecase {
  _FakeRemoveWatchlistUsecase_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieDetail_5 extends _i1.SmartFake implements _i7.MovieDetail {
  _FakeMovieDetail_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieDetailNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieDetailNotifier extends _i1.Mock
    implements _i8.MovieDetailNotifier {
  MockMovieDetailNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DetailMovieUsecase get detailMovieUsecase => (super.noSuchMethod(
        Invocation.getter(#detailMovieUsecase),
        returnValue: _FakeDetailMovieUsecase_0(
          this,
          Invocation.getter(#detailMovieUsecase),
        ),
      ) as _i2.DetailMovieUsecase);

  @override
  _i3.RecommendedMovieUsecase get recommendedMovieUsecase =>
      (super.noSuchMethod(
        Invocation.getter(#recommendedMovieUsecase),
        returnValue: _FakeRecommendedMovieUsecase_1(
          this,
          Invocation.getter(#recommendedMovieUsecase),
        ),
      ) as _i3.RecommendedMovieUsecase);

  @override
  _i4.WatchlistMovieStatusUsecase get watchlistMovieUsecase =>
      (super.noSuchMethod(
        Invocation.getter(#watchlistMovieUsecase),
        returnValue: _FakeWatchlistMovieStatusUsecase_2(
          this,
          Invocation.getter(#watchlistMovieUsecase),
        ),
      ) as _i4.WatchlistMovieStatusUsecase);

  @override
  _i5.SaveWatchlistUsecase get saveWatchlist => (super.noSuchMethod(
        Invocation.getter(#saveWatchlist),
        returnValue: _FakeSaveWatchlistUsecase_3(
          this,
          Invocation.getter(#saveWatchlist),
        ),
      ) as _i5.SaveWatchlistUsecase);

  @override
  _i6.RemoveWatchlistUsecase get removeWatchlist => (super.noSuchMethod(
        Invocation.getter(#removeWatchlist),
        returnValue: _FakeRemoveWatchlistUsecase_4(
          this,
          Invocation.getter(#removeWatchlist),
        ),
      ) as _i6.RemoveWatchlistUsecase);

  @override
  _i7.MovieDetail get movie => (super.noSuchMethod(
        Invocation.getter(#movie),
        returnValue: _FakeMovieDetail_5(
          this,
          Invocation.getter(#movie),
        ),
      ) as _i7.MovieDetail);

  @override
  _i9.RequestState get movieState => (super.noSuchMethod(
        Invocation.getter(#movieState),
        returnValue: _i9.RequestState.Empty,
      ) as _i9.RequestState);

  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: _i10.dummyValue<String>(
          this,
          Invocation.getter(#message),
        ),
      ) as String);

  @override
  bool get isAddedToWatchlist => (super.noSuchMethod(
        Invocation.getter(#isAddedToWatchlist),
        returnValue: false,
      ) as bool);

  @override
  String get watchlistMessage => (super.noSuchMethod(
        Invocation.getter(#watchlistMessage),
        returnValue: _i10.dummyValue<String>(
          this,
          Invocation.getter(#watchlistMessage),
        ),
      ) as String);

  @override
  List<_i11.Movie> get movieRecommendations => (super.noSuchMethod(
        Invocation.getter(#movieRecommendations),
        returnValue: <_i11.Movie>[],
      ) as List<_i11.Movie>);

  @override
  _i9.RequestState get recommenddationsState => (super.noSuchMethod(
        Invocation.getter(#recommenddationsState),
        returnValue: _i9.RequestState.Empty,
      ) as _i9.RequestState);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i12.Future<void> fetchMovieDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #fetchMovieDetail,
          [id],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);

  @override
  _i12.Future<void> addWatchlist(_i7.MovieDetail? movie) => (super.noSuchMethod(
        Invocation.method(
          #addWatchlist,
          [movie],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);

  @override
  _i12.Future<void> loadWatchlistStatus(int? id) => (super.noSuchMethod(
        Invocation.method(
          #loadWatchlistStatus,
          [id],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);

  @override
  _i12.Future<void> removeFromWatchlist(_i7.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeFromWatchlist,
          [movie],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);

  @override
  void addListener(_i13.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i13.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}