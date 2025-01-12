import 'dart:convert';
import 'package:flutter_bloc_example/features/models/posts_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PostRepo {
  Future<List<PostsModel>> fetchPost() async {
    try {
      final apiUrl = dotenv.env['API_URL'] ?? "not found";
      final response = await http.get(
        Uri.parse(apiUrl),
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
