import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository', () {
    final repository = MovieRepository();

    test('returns the two expected films', () {
      final movies = repository.getMovies();

      expect(movies, hasLength(2));

      final redNotice = movies.singleWhere((movie) => movie.id == 'red-notice');
      expect(redNotice.title, 'Red Notice');
      expect(redNotice.ticketPrice, 8.50);
      expect(redNotice.posterImagePath, isNotEmpty);

      final seventyTwoHours =
          movies.singleWhere((movie) => movie.id == '72-hours');
      expect(seventyTwoHours.title, '72 Hours');
      expect(seventyTwoHours.ticketPrice, 9.00);
      expect(seventyTwoHours.posterImagePath, isNotEmpty);
    });

    test('returns the matching movie for an existing ID', () {
      final movie = repository.getMovieById('red-notice');

      expect(movie, isNotNull);
      expect(movie?.title, 'Red Notice');
    });

    test('returns null for a missing ID', () {
      expect(repository.getMovieById('missing-movie'), isNull);
    });
  });
}
