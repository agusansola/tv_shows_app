import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows_app/providers/shows_provider.dart';
import 'package:tv_shows_app/widgets/common/empty_widget.dart';
import 'package:tv_shows_app/widgets/common/error_message_widget.dart';
import 'package:tv_shows_app/widgets/common/loading_widget.dart';
import 'package:tv_shows_app/widgets/shows_list_screen/shows_grid_widget.dart';

//TODO: no hardcoded strings, use specific file for all strings in app. 
class ShowsListScreen extends StatefulWidget {
  const ShowsListScreen({super.key});

  @override
  State<ShowsListScreen> createState() => _ShowsListScreenState();
}

class _ShowsListScreenState extends State<ShowsListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<ShowsProvider>().getShows();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ShowsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('TV Shows'),
        actions: [
          IconButton(
            onPressed: provider.isLoading ? null : provider.getShows,
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
          ),
          //TODO: instead of empty padding widget, used a const SizedBox with fixed width.
          Padding(padding: EdgeInsets.only(right: 24.0)),
        ],
      ),
      body: _buildBody(provider),
    );
  }

  Widget _buildBody(ShowsProvider provider) {

    //TODO: handle better refresh condition. if(provider.isLoading && provider.shows.isEmpty) return LoadingWidget
    if (provider.isLoading) {
      return const LoadingWidget();
    }

    if (provider.errorMessage != null) {
      return ErrorMessageWidget(
        message: provider.errorMessage ?? 'ERROR',
        onRetry: () {
          //TODO: no need for fulle method, we have provider as a parameter. We can write: provider.getShows
          context.read<ShowsProvider>().getShows();
        },
      );
    }

    if (provider.shows.isEmpty) {
      return const EmptyWidget(message: 'No shows found');
    }

    return ShowsGrid(shows: provider.shows);
  }
}
