import 'package:dartz/dartz.dart';
import 'package:moonton/common/failure.dart';
import 'package:moonton/domain/entities/movie.dart';
import 'package:moonton/domain/repositories/movie_repository.dart';

class GetMovieRecommendations {
  final MovieRepository repository;

  GetMovieRecommendations(this.repository);

  Future<Either<Failure, List<Movie>>> execute(id) {
    return repository.getMovieRecommendations(id);
  }
}
