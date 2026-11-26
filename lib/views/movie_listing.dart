import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({super.key, required this.movie});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              movie.posterImagePath,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Text(movie.title),
            Text('Age rating: ${movie.ageRating}'),
            Text('Screening time: ${movie.screeningTime}'),
            Text('Ticket price: ${movie.formattedPrice}'),
            const SizedBox(height: 8),
            Text(movie.synopsis),
            const SizedBox(height: 16),
            DropdownMenu<int>(
              label: const Text('Ticket quantity'),
              initialSelection: _ticketQuantity,
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: '1'),
                DropdownMenuEntry(value: 2, label: '2'),
                DropdownMenuEntry(value: 3, label: '3'),
                DropdownMenuEntry(value: 4, label: '4'),
                DropdownMenuEntry(value: 5, label: '5'),
              ],
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _ticketQuantity = value;
                  });
                }
              },
            ),
            const SizedBox(height: 8),
            Text('Tickets selected: $_ticketQuantity'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bookingMessage =
                      'Added $_ticketQuantity tickets to the order';
                });
              },
              child: const Text('Add to order'),
            ),
            const SizedBox(height: 8),
            Text(_bookingMessage),
          ],
        ),
      ),
    );
  }
}
