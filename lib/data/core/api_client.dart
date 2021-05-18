import 'package:http/http.dart';
import 'dart:convert';
import 'package:logger/logger.dart';

class ApiClient {
  var log = Logger();
  final Client _client;
  ApiClient(this._client);

  dynamic get(String url) async {
    var urll = Uri.parse(url);
    final response = await _client.get(
      urll,
      headers: {
        'Content-Type': 'applicaton/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
