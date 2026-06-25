import 'package:flutter/material.dart';
import 'package:tv_shows_app/models/show_model.dart';

class ShowsCard extends StatelessWidget {
  final ShowModel show;
  final VoidCallback onCardTap;

  const ShowsCard({super.key, required this.show, required this.onCardTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onCardTap,
        child: Column(
          children: [
            _buildImage(show),
            Padding(padding: EdgeInsets.only(bottom: 8.0)),
            Text(
              show.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  show.rating.average.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Icon(Icons.star),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 8.0)),
          ],
        ),
      ),
    );
  }
}

Widget _buildImage(ShowModel show) {
  final imageMedium = show.image.medium;

  return Image.network(
    imageMedium,
    width: double.infinity,
    height: 185,
    fit: BoxFit.cover,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) {
        return child;
      }
      return SizedBox(
        width: double.infinity,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    },
    errorBuilder: (context, error, stackTrace) {
      return Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.image_not_supported),
      );
    },
  );
}
