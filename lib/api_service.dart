import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/models/transaction.dart';
import 'package:http/http.dart' as http;

class Repository{
  final _baseUrl = 'https://6396607190ac47c68084d682.mockapi.io/transactions';

  Future getData() async{
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Money> moneys = it.map((e) => Money.fromJson(e)).toList();

        return moneys;
      }
    } catch (e) {
      
    }
  }
}