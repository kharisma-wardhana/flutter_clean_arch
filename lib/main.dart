import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moonton/common/constants.dart';
import 'package:moonton/common/utils.dart';
import 'package:moonton/presentation/pages/about_page.dart';
import 'package:moonton/presentation/pages/home_movie_page.dart';
import 'package:moonton/presentation/pages/movie_detail_page.dart';
import 'package:moonton/presentation/pages/popular_movies_page.dart';
import 'package:moonton/presentation/pages/search_page.dart';
import 'package:moonton/presentation/pages/top_rated_movies_page.dart';
import 'package:moonton/presentation/pages/watchlist_movies_page.dart';
import 'package:provider/provider.dart';
import 'package:moonton/injection.dart' as di;
import 'package:moonton/presentation/provider/movie_detail_notifier.dart';
import 'package:moonton/presentation/provider/movie_list_notifier.dart';
import 'package:moonton/presentation/provider/movie_search_notifier.dart';
import 'package:moonton/presentation/provider/popular_movies_notifier.dart';
import 'package:moonton/presentation/provider/top_rated_movies_notifier.dart';
import 'package:moonton/presentation/provider/watchlist_movie_notifier.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
          useMaterial3: true,
        ),
        home: const HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => const HomeMoviePage());
            case PopularMoviesPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const PopularMoviesPage());
            case TopRatedMoviesPage.routeName:
              return CupertinoPageRoute(
                  builder: (_) => const TopRatedMoviesPage());
            case MovieDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.routeName:
              return CupertinoPageRoute(builder: (_) => const SearchPage());
            case WatchlistMoviesPage.routeName:
              return MaterialPageRoute(
                  builder: (_) => const WatchlistMoviesPage());
            case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) => const AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
