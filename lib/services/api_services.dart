import 'dart:convert';
import 'package:enrope/model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String base_url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<post_model>> fetchPosts() async {
    final response = await http.get(Uri.parse(base_url));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => post_model.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
