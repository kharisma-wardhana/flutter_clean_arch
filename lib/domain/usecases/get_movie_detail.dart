import 'package:dartz/dartz.dart';
import 'package:moonton/common/failure.dart';
import 'package:moonton/domain/entities/movie_detail.dart';
import 'package:moonton/domain/repositories/movie_repository.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
