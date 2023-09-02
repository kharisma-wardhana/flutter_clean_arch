import 'package:dartz/dartz.dart';
import 'package:moonton/common/failure.dart';
import 'package:moonton/domain/entities/tv_series.dart';
import 'package:moonton/domain/entities/tv_series_detail.dart';

abstract class TVSeriesRepository {
  Future<Either<Failure, List<TVSeries>>> getNowPlayingTVSeries();

  Future<Either<Failure, List<TVSeries>>> getPopularTVSeries();

  Future<Either<Failure, List<TVSeries>>> getTopRatedTVSeries();

  Future<Either<Failure, TVSeriesDetail>> getTVSeriesDetail(int id);

  Future<Either<Failure, List<TVSeries>>> getTVSeriesRecommendations(int id);

  Future<Either<Failure, String>> saveWatchlist(TVSeriesDetail tvSeries);

  Future<Either<Failure, String>> removeWatchlist(TVSeriesDetail tvSeries);

  Future<bool> isAddedToWatchlist(int id);

  Future<Either<Failure, List<TVSeries>>> getWatchlistTVSeries();
}
