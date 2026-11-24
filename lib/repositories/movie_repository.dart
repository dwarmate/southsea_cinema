import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: '1',
        title: '72 Hours',
        description:
            'Two brothers who have three days to rescue a kidnapped girl.',
        price: 7.50,
        posterPath: 'assets/images/72_hours.jpeg',
      ),
      Movie(
        id: '2',
        title: 'Red Notice',
        description:
            'An FBI agent who teams up with a thief to catch another thief.',
        price: 4.50,
        posterPath: 'assets/images/red_notice.jpeg',
      ),
    ];
  }
}
