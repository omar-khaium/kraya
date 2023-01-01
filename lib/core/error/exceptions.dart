import 'package:http/http.dart';

class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  factory ServerException.fromHttpResponse(Response response) {
    return ServerException(response.reasonPhrase ?? response.body);
  }
  factory ServerException.fromStreamedResponse(StreamedResponse response, String body) {
    return ServerException(response.reasonPhrase ?? body);
  }
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}

class ProfileNotFoundException implements Exception {}
