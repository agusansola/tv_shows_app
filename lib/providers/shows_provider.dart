import 'package:flutter/material.dart';
import 'package:tv_shows_app/models/show_model.dart';
import 'package:tv_shows_app/services/shows_api_service.dart';

//TODO: no hardcoded strings, use specific file for all strings in app. 
//TODO: use an enum with the different possible statuses that could be present. This helps handle better and in a less ambiguous way explicit states. Helps render initState in ShowsListScreen safer while calling getShows().
class ShowsProvider extends ChangeNotifier {
  final ShowsApiService _api;

  ShowsProvider(this._api);

  List<ShowModel> _shows = [];
  bool _isLoading = false;
  String? _errorMessage;

  //TODO: turn _shows list in unmodifiable so that the original shows list can't be accessed and modified outside of provider. 
  List<ShowModel> get shows => _shows;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> getShows() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _shows = await _api.fetchShows();
    } catch (error) {
      _errorMessage = 'Error loading shows';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
