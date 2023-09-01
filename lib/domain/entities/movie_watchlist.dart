import 'package:equatable/equatable.dart';

class MovieWatchlist extends Equatable {
  final int id;
  final String overview;
  final String posterPath;
  final String title;

  const MovieWatchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
  });

  @override
  List<Object?> get props => [id, overview, posterPath, title];
}
