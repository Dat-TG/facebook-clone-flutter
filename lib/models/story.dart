import 'package:facebook/models/user.dart';

class Story {
  final User user;
  final List<String>? image;
  final List<String>? video;
  final List<String>? music;
  final List<String> time;
  final String shareWith;
  Story(
      {required this.user,
      this.image,
      this.video,
      this.music,
      required this.time,
      required this.shareWith});

  // shareWith: public, friends, friends-of-friends, private
}
