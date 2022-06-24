import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  void JembatanAPI(String id) async {
    var url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilData = await http.get(url);

    _data = (json.decode(hasilData.body))['data'];
    notifyListeners();
  }
}
