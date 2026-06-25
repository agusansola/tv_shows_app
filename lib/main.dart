import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tv_shows_app/app.dart';
import 'package:tv_shows_app/providers/shows_provider.dart';
import 'package:tv_shows_app/services/shows_api_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShowsProvider(ShowsApiService())),
      ],
      child: const App(),
    ),
  );
}
