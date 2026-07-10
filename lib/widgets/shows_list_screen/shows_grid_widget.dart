import 'package:flutter/material.dart';
import 'package:tv_shows_app/models/show_model.dart';
import 'package:tv_shows_app/screens/shows_detail_screen.dart';
import 'package:tv_shows_app/widgets/shows_list_screen/shows_card_widget.dart';

//TODO: no hardcoded strings, use specific file for all strings in app. 
class ShowsGrid extends StatelessWidget {
  final List<ShowModel> shows;

  const ShowsGrid({super.key, required this.shows});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: shows.length,

      //TODO: Instead of a fixed number for CrossAxisCount use SliverGridDelegateWithMaxCrossAxisExtent where we handle a maximum width that can be taken of the screen. This way Flutter calculates how many columns fit in the available space. 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 48.0,
        mainAxisSpacing: 16.0,
        //TODO: use childAspectRatio to handle card ratio better 
      ),
      itemBuilder: (context, index) {
        final show = shows[index];

        return ShowsCard(
          show: show,
          onCardTap: () {
            //TODO: use callback function instead of actual logic inside widget. By doing so, widget is merely used for UI and become more reusable, with no logic inside it. 
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
