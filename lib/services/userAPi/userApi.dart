import 'dart:convert';
import 'dart:developer';

import 'package:enrope/model/userModel/userModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Userapi {
  final String baseUrl = 'https://68f228c1b36f9750deeb9e3e.mockapi.io/nazzu';

  Future<List<UserModel>> getUsers() async {
    print('called');
    final response = await http.get(
      Uri.parse("https://68f228c1b36f9750deeb9e3e.mockapi.io/nazzu/user"),
    );
    // log('message');
    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Something error ');
    }
  }

  Future<UserModel> addUser(String name) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // log('${response.statusCode}');
      // log('${response.body}');
      final Map<String, dynamic> data = jsonDecode(response.body);

      return UserModel.fromJson(data);
    } else {
      throw Exception('Something error');
    }
  }

  Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/user/$id'));

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to delete user');
    }
  }
}
