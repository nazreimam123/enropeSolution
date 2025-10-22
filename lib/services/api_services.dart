import 'dart:convert';
import 'dart:developer';
import 'package:enrope/model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<post_model>> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    log('fetching data ');

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => post_model.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
