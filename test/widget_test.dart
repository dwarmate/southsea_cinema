import 'package:flutter/material.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
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
  testWidgets('Red Notice opens and shows booking feedback', (tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());

    final redNoticeCard = find.ancestor(
      of: find.text('Red Notice'),
      matching: find.byType(MovieCard),
    );
    final bookRedNotice = find.descendant(
      of: redNoticeCard,
      matching: find.text('Book Now'),
    );

    await tester.ensureVisible(bookRedNotice);
    await tester.tap(bookRedNotice);
    await tester.pumpAndSettle();

    expect(find.byType(MovieListing), findsOneWidget);
    expect(find.text('Red Notice'), findsOneWidget);
    expect(find.text('Screening time: 6:00 PM'), findsOneWidget);
    expect(find.text('Ticket price: £8.50'), findsOneWidget);

    final addToOrder = find.widgetWithText(ElevatedButton, 'Add to order');
    await tester.ensureVisible(addToOrder);
    await tester.tap(addToOrder);
    await tester.pumpAndSettle();

    expect(find.text('Added 1 tickets to the order'), findsOneWidget);
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(find.text('Movie Menu'), findsOneWidget);

    final seventyTwoHoursCard = find.ancestor(
      of: find.text('72 Hours'),
      matching: find.byType(MovieCard),
    );
    final bookSeventyTwoHours = find.descendant(
      of: seventyTwoHoursCard,
      matching: find.text('Book Now'),
    );

    await tester.ensureVisible(bookSeventyTwoHours);
    await tester.tap(bookSeventyTwoHours);
    await tester.pumpAndSettle();

    expect(find.byType(MovieListing), findsOneWidget);
    expect(find.text('72 Hours'), findsOneWidget);
    expect(find.text('Screening time: 8:30 PM'), findsOneWidget);
    expect(find.text('Ticket price: £9.00'), findsOneWidget);
    expect(find.text('Tickets selected: 1'), findsOneWidget);
    expect(find.text('Added 1 tickets to the order'), findsNothing);
  });
}
