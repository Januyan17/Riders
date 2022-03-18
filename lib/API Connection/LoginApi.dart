import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

// ignore: camel_case_types
class callLoginapi {
  final String _baseUrl = "http://mangakiku-api.moodfor.codes/api/";

  postData(data, apiurl) async {
    var fullurl = _baseUrl + apiurl;

    return await http.post(Uri.parse(fullurl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
