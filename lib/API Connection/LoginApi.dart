import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

// ignore: camel_case_types
class callApi {
  final String _baseUrl = "http://mangakiku-api.moodfor.codes/api/";
  var scoreurl = "https://dcaapi.moodfor.codes/scoreboards";

  postData(data, apiurl) async {
    var fullurl = _baseUrl + apiurl;

    return await http.post(Uri.parse(fullurl),
        body: jsonEncode(data), headers: _setHeaders());
  }

// score
  getScoreBoard(apiUrl) async {
    var fullUrl = Uri.parse(scoreurl + apiUrl);
    return await http.get(
      fullUrl,
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
