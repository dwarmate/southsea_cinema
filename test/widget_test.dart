import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

void main() {
  testWidgets('Home page shows the movie menu and booking buttons', (
    tester,
  ) async {
    await tester.pumpWidget(const SouthseaCinemaApp());

    expect(find.text('Movie Menu'), findsOneWidget);
    expect(find.byType(MovieCard), findsNWidgets(2));
    expect(find.text('Red Notice'), findsOneWidget);
    expect(find.text('72 Hours'), findsOneWidget);
    expect(find.text('Book Now'), findsNWidgets(2));
  });
}
