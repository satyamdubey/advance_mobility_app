import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';

final class UserPost extends Equatable {
  const UserPost({required this.id, required this.title, required this.body});

  final int id;
  final String title;
  final String body;

  @override
  List<Object> get props => [id, title, body];

  factory UserPost.fromJson(Map<String, dynamic> json){
    return UserPost(
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
  };
}

class PostConverter extends JsonConverter {
  UserPost fromJson(Map<String, dynamic> json) => UserPost.fromJson(json);
  Map<String, dynamic> toJson(Object object) => (object as UserPost).toJson();
}

