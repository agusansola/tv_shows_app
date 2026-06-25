import 'package:flutter/material.dart';
import 'package:tv_shows_app/models/show_model.dart';
import 'package:tv_shows_app/services/shows_api_service.dart';

class ShowsProvider extends ChangeNotifier {
  final ShowsApiService _api;

  ShowsProvider(this._api);

  List<ShowModel> _shows = [];
  bool _isLoading = false;
  String? _errorMessage;

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
