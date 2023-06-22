import 'dart:convert';
import 'dart:io';
import 'package:flutter_anime_flix/resources/data/exceptions.dart';
import 'package:flutter_anime_flix/resources/data/network/network_base.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class NetworkService extends NetworkBase {
  Client httpClient = http.Client();
  @override
  Future<dynamic> get(Uri uri) async {
    dynamic responseJson;
    try {
      final response =
          await httpClient.get(uri).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      rethrow;
    }

    return responseJson;
  }

  @override
  Future<dynamic> post(String url, Map<String, dynamic> data,
      {Map<String, dynamic>? queryParameters}) async {
    dynamic responseJson;
    try {
      Response response = await httpClient
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      rethrow;
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with serverwith status code${response.statusCode}');
    }
  }
}
