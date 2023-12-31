import 'package:dartz/dartz.dart';
import 'package:moonton/common/failure.dart';
import 'package:moonton/domain/entities/movie_detail.dart';
import 'package:moonton/domain/repositories/movie_repository.dart';

class SaveWatchlist {
  final MovieRepository repository;

  SaveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveWatchlist(movie);
  }
}
