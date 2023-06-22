import 'dart:developer';

import 'package:flutter_anime_flix/locator.dart';
import 'package:flutter_anime_flix/resources/constants/endpoints.dart';
import 'package:flutter_anime_flix/services/helpers/network.dart';

class MovieRepositories {
  final NetworkService _network = locator<NetworkService>();

  Future<List<Map<String, dynamic>>> getMoviesById(int id) async {
    try {
      final uri = Uri.http(Endpoints.baseUrl, Endpoints.moviesDiscover, {
        "api_key": "3160ef70b1bebde34162fd76debc6c2e",
        "with_genre": id.toString()
      });
      final response = await _network.get(uri);
      return (response["results"] as List)
          .map((item) => Map<String, dynamic>.from(item))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getMovieTeaserById(int movieId) async {
    log(movieId.toString());
    try {
      final uri =
          Uri.http(Endpoints.baseUrl, "${Endpoints.movies}/$movieId/videos", {
        "api_key": "3160ef70b1bebde34162fd76debc6c2e",
      });
      final response = await _network.get(uri);
      final List<dynamic> videos = response["results"];
      final String key = videos.firstWhere((element) =>
          element["type"] == "Teaser" || element["type"] == "Trailer")["key"];
      log(key);
      return key;
    } catch (e) {
      rethrow;
    }
  }
}
