import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PostClient {
  var log = Logger();

  dynamic post(String url, Map<String, String> body) async {
    var urll = Uri.parse(url);
    try {
      final response = await http
          .post(
            urll,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: json.encode(body),
          )
          .timeout(
            Duration(seconds: 3),
          );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return json.decode(response.body);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } on TimeoutException {
      throw Exception("Connection Timeout");
    } on SocketException {
      throw Exception("Something wrong with connection");
    }
  }

  dynamic delete(String url,String id) async {
    var urll = Uri.parse(url);
    try {
      final response = await http.delete(
        urll,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(
        Duration(seconds: 3),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log.i(response.body);
        return json.decode(response.body);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } on TimeoutException {
      throw Exception("Connection Timeout");
    } on SocketException {
      throw Exception("Something wrong with connection");
    }
  }
}
