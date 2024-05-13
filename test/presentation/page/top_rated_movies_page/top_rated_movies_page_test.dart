



import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/common/state.dart';
import 'package:movie_app/domain/entitites/movie/movie.dart';
import 'package:movie_app/presentation/pages/movies/top_rated_movies_page.dart';
import 'package:movie_app/presentation/provider/movie/top_rated_movie_notifier.dart';
import 'package:provider/provider.dart';

import 'top_rated_movies_page_test.mocks.dart';

@GenerateMocks([
  TopRatedMoviesNotifier,
])
void main(){
  late MockTopRatedMoviesNotifier mockTopRatedMoviesNotifier;
  setUp((){
    mockTopRatedMoviesNotifier = MockTopRatedMoviesNotifier();
  });


  Widget _makeTestableWidget(Widget body){
    return ChangeNotifierProvider<TopRatedMoviesNotifier>.value(
      value: mockTopRatedMoviesNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }


  testWidgets('Page should display progress bar when loading', (WidgetTester tester) async {
    when(mockTopRatedMoviesNotifier.state).thenReturn(RequestState.Loading);

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error', (WidgetTester tester) async {

    when(mockTopRatedMoviesNotifier.state).thenReturn(RequestState.Error);
    when(mockTopRatedMoviesNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(Key('error_message'));
    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));
    expect(textFinder, findsOneWidget);
  });


  testWidgets('Page should display when data is success', (WidgetTester tester) async {
    when(mockTopRatedMoviesNotifier.state).thenReturn(RequestState.Success);
    when(mockTopRatedMoviesNotifier.movie).thenReturn(<Movie>[]);

    final listViewFinder = find.byType(ListView);
    await tester.pumpWidget(_makeTestableWidget(TopRatedMoviesPage()));
    expect(listViewFinder, findsOneWidget);
  });

}