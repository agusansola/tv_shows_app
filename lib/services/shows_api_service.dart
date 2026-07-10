import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tv_shows_app/models/show_model.dart';

//TODO: no hardcoded strings, use specific file for all strings in app. 
//TODO: add a timeout for the api call. 
//TODO: handle diverse status codes, not just 200. 
//TODO: no hardcoded strings, use specific file for all strings in app. 
class ShowsApiService {
  static const String _baseUrl = 'https://api.tvmaze.com/shows';

  Future<List<ShowModel>> fetchShows() async {
    final uri = Uri.parse(_baseUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      return ShowModel.listFromJson(jsonList);
    } else {
      //TODO: error message duplicated with provider's error message. In the exception we can put in response.statusCode 
      throw Exception('Error loading shows');
    }
  }
}
