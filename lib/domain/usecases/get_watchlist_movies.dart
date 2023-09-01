import 'package:dartz/dartz.dart';
import 'package:moonton/common/failure.dart';
import 'package:moonton/domain/entities/movie.dart';
import 'package:moonton/domain/repositories/movie_repository.dart';

class GetWatchlistMovies {
  final MovieRepository _repository;

  GetWatchlistMovies(this._repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _repository.getWatchlistMovies();
  }
}
