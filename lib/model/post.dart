import 'package:social_media_project/model/user.dart';

class Post {
  late final String title;
  late final String content;
  late final String picture;
  late final User user;

  Post({
    required this.title,
    required this.content,
    required this.picture,
    required this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      content: json['content'],
      picture: json['picture'],
      user: User.fromJson(json['user']),
    );
  }
}
