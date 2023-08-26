import 'package:facebook/models/user.dart';

class Story {
  final User user;
  final String image;
  final String? video;
  final String? music;
  final DateTime time;
  Story({
    required this.user,
    required this.image,
    this.video,
    this.music,
    required this.time,
  });
}
