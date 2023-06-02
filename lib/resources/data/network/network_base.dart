abstract class NetworkBase {
  Future<dynamic> get(Uri uri);

  Future<dynamic> post(String url, Map<String, dynamic> data,
      {Map<String, dynamic>? queryParameters});
}
