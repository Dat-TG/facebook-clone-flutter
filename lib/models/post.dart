import 'package:facebook/models/user.dart';

class Post {
  final User user;
  final String time;
  final String shareWith;
  final List<String>? image;
  final List<String>? video;
  final String? content;
  final List<String>? text;
  final String? checkin;
  final int? like;
  final int? haha;
  final int? sad;
  final int? love;
  final int? lovelove;
  final int? angry;
  final int? comment;
  final int? share;
  final int? wow;
  final String? layout; // classic, column, quote, frame
  final String? type; //normal, share, memory, ...
  Post({
    required this.user,
    required this.time,
    required this.shareWith,
    this.image,
    this.video,
    this.content,
    this.text,
    this.checkin,
    this.like,
    this.haha,
    this.sad,
    this.love,
    this.lovelove,
    this.angry,
    this.comment,
    this.share,
    this.wow,
    this.layout,
    this.type,
  });

  Post copyWith({
    User? user,
    String? time,
    String? shareWith,
    List<String>? image,
    List<String>? video,
    String? content,
    List<String>? text,
    String? checkin,
    int? like,
    int? haha,
    int? sad,
    int? love,
    int? lovelove,
    int? angry,
    int? comment,
    int? share,
    int? wow,
    String? layout,
    String? type,
  }) {
    return Post(
      user: user ?? this.user,
      time: time ?? this.time,
      shareWith: shareWith ?? this.shareWith,
      image: image ?? this.image,
      video: video ?? this.video,
      content: content ?? this.content,
      text: text ?? this.text,
      checkin: checkin ?? this.checkin,
      like: like ?? this.like,
      haha: haha ?? this.haha,
      sad: sad ?? this.sad,
      love: love ?? this.love,
      lovelove: lovelove ?? this.lovelove,
      angry: angry ?? this.angry,
      comment: comment ?? this.comment,
      share: share ?? this.share,
      wow: wow ?? this.wow,
      layout: layout ?? this.layout,
      type: type ?? this.type,
    );
  }
}
