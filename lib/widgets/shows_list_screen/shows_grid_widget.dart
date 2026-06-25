import 'package:flutter/material.dart';
import 'package:tv_shows_app/models/show_model.dart';
import 'package:tv_shows_app/screens/shows_detail_screen.dart';
import 'package:tv_shows_app/widgets/shows_list_screen/shows_card_widget.dart';

class ShowsGrid extends StatelessWidget {
  final List<ShowModel> shows;

  const ShowsGrid({super.key, required this.shows});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: shows.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 48.0,
        mainAxisSpacing: 16.0,
      ),
      itemBuilder: (context, index) {
        final show = shows[index];

        return ShowsCard(
          show: show,
          onCardTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowDetailScreen(show: show),
              ),
            );
          },
        );
      },
    );
  }
}
