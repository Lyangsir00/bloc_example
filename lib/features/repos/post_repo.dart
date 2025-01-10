import 'dart:convert';
import 'package:flutter_bloc_example/features/models/posts_model.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  Future<List<PostsModel>> fetchPost() async {
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        return data.map((e) => PostsModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load posts.  ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');

      return [];
    }
  }
}
