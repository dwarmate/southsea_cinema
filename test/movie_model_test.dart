import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model', () {
    const redNotice = Movie(
      id: 'red-notice',
      title: 'Red Notice',
      synopsis: 'An FBI agent teams up with an art thief.',
      ageRating: '12',
      screeningTime: '6:00 PM',
      ticketPrice: 8.50,
      posterImagePath: 'assets/images/red_notice.jpeg',
    );

    const seventyTwoHours = Movie(
      id: '72-hours',
      title: '72 Hours',
      synopsis: 'A film with a whole-pound ticket price.',
      ageRating: '15',
      screeningTime: '8:30 PM',
      ticketPrice: 9.00,
      posterImagePath: 'assets/images/72_hours.jpeg',
    );

    test('stores all constructor values', () {
      expect(redNotice.id, 'red-notice');
      expect(redNotice.title, 'Red Notice');
      expect(redNotice.synopsis, 'An FBI agent teams up with an art thief.');
      expect(redNotice.ageRating, '12');
      expect(redNotice.screeningTime, '6:00 PM');
      expect(redNotice.ticketPrice, 8.50);
      expect(redNotice.posterImagePath, 'assets/images/red_notice.jpeg');
    });

    test('formats a whole-pound price with two decimal places', () {
      expect(seventyTwoHours.formattedPrice, '£9.00');
    });

    test('formats a price with pence using two decimal places', () {
      expect(redNotice.formattedPrice, '£8.50');
    });
  });
}
