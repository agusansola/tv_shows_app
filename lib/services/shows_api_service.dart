import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tv_shows_app/models/show_model.dart';

class ShowsApiService {
  static const String _baseUrl = 'https://api.tvmaze.com/shows';

  Future<List<ShowModel>> fetchShows() async {
    final uri = Uri.parse(_baseUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      return ShowModel.listFromJson(jsonList);
    } else {
      throw Exception('Error loading shows');
    }
  }
}
