import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/models/google_response.dart';
/* import 'package:peliculas_app/helpers/debouncer.dart';
import 'package:peliculas_app/models/search_movie_respons.dart';
import '../models/models.dart'; */

class RestaurantsProvider extends ChangeNotifier {
  final String kGoogleApiKey = 'AIzaSyCjhGNgCppr02OR5yFOMwFquZRa3n07aL4';
  final String _baseUrl = 'maps.googleapis.com';

  Future<List<Restaurant>> searchRestaurants(String query) async {
    final url = Uri.https(_baseUrl, 'maps/api/place/textsearch/json', {
      'query': query,
      'key': kGoogleApiKey,
    });

    final response = await http.get(url);

    final googleResponse = GoogleResponse.fromJson(response.body);

    return googleResponse.results;
  }
}
