import 'package:facebook/models/user.dart';

class Comment {
  final User user;
  final String content;
  final String? image;
  final int? like;
  final int? haha;
  final int? sad;
  final int? love;
  final int? lovelove;
  final int? angry;
  final int? wow;
  final String time;
  final List<Comment> replies;
  Comment({
    required this.user,
    required this.content,
    this.image,
    this.like,
    this.haha,
    this.sad,
    this.love,
    this.lovelove,
    this.angry,
    this.wow,
    required this.time,
    required this.replies,
  });
}
