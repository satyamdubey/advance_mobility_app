import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:advance_mobility_app/posts/repository/post.dart';


class PostsRepository {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> getPosts() async {
    final url = Uri.parse('$baseUrl/posts');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts: ${response.statusCode}');
    }
  }

  Future<void> createPost(String postTitle, String postBody) async {
    final url = Uri.parse('$baseUrl/posts');
    final body = jsonEncode({'title': postTitle, 'body': postBody});
    final response = await http.post(url, body: body, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 201) {
      // Post created successfully (no data returned typically)
    } else {
      throw Exception('Failed to create post: ${response.statusCode}');
    }
  }
}



