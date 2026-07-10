import 'package:flutter/material.dart';
import 'package:tv_shows_app/models/show_model.dart';

//TODO: no hardcoded strings, use specific file for all strings in app. 
class ShowDetailScreen extends StatelessWidget {
  final ShowModel show;
  const ShowDetailScreen({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    final rating = show.rating.average?.toString() ?? 'N/A';

    return Scaffold(
      appBar: AppBar(title: Text(show.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        //TODO: use LayoutBuilder for a responsive UI disposition of widgets on screen based on the width of the screen. Example: row for tablet and desktop screen dimensions, Column for phone screen dimensions. 
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _buildImage(),
              ),
            ),

            const SizedBox(width: 24),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          show.name,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      const Icon(Icons.star),
                      const SizedBox(width: 4),
                      Text(rating),
                    ],
                  ),

                  const SizedBox(height: 16),

                  if (show.genres.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: show.genres.map((genre) {
                        return Chip(label: Text(genre));
                      }).toList(),
                    ),

                  const SizedBox(height: 24),

                  _buildInfoRow('Premiered', show.premiered),
                  _buildInfoRow('Status', show.status),
                  _buildInfoRow('Language', show.language),
                  _buildInfoRow('Network', show.network?.name ?? 'N/A'),

                  const SizedBox(height: 24),

                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    show.cleanSummary,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    final imageOriginal = show.image.original;

    //TODO: wrap Image.network in AspectRatio widget to better handle height dimension. AspectRatio looks at the space received from the parent widget and uses width/height ratio to better accomodate child widget inside parent widget. 
    //TODO: Remove fixed height.
    return Image.network(
      imageOriginal,
      height: 280,
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

  Widget _buildInfoRow(String label, String value) {
    if (value.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
