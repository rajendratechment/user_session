import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'model/Album.dart';

class Server extends ChangeNotifier {
  Future<Album> fetchSingleAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Album>> fetchListAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<Album> albumList =
          List<Album>.from(l.map((model) => Album.fromJson(model)));
      return albumList;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
