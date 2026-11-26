import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'red-notice',
        title: 'Red Notice',
        synopsis:
            'An FBI agent teams up with an art thief to catch a rival criminal.',
        ageRating: '12',
        screeningTime: '6:00 PM',
        ticketPrice: 8.50,
        posterImagePath: 'assets/images/red_notice.jpeg',
      ),
      Movie(
        id: '72-hours',
        title: '72 Hours',
        synopsis:
            'Two brothers have three days to rescue their family from danger.',
        ageRating: '15',
        screeningTime: '8:30 PM',
        ticketPrice: 9.00,
        posterImagePath: 'assets/images/72_hours.jpeg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }

    return null;
  }
}
