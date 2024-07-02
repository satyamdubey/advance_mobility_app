import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:advance_mobility_app/config/constants/api_constants.dart';
import 'package:advance_mobility_app/features/user_posts/repository/user_post.dart';


class UserPostsRepository {

  static String baseUrl = ApiConstant.baseUrl;

  Future<List<UserPost>> getUserPosts() async {
    final url = Uri.parse(ApiConstant.baseUrl+ApiConstant.userPosts);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        return data.map((post) => UserPost.fromJson(post)).toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw Exception('Some unknown exceptions');
    }
  }

  Future<void> createUserPost(String postTitle, String postBody) async {
    final url = Uri.parse(ApiConstant.baseUrl+ApiConstant.userPosts);
    final body = jsonEncode({'title': postTitle, 'body': postBody});
    try {
      final response = await http.post(url, body: body, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 201) {
        //no data return
      } else {
        throw Exception('Failed to create post: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw Exception('Some unknown exceptions');
    }
  }
}
