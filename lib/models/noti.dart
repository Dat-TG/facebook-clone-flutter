class Noti {
  final String content;
  final List<String>? bold;
  final String image;
  final String time;
  final String type;
  final bool? seen;
  Noti(
      {required this.content,
      this.bold,
      required this.image,
      required this.time,
      required this.type,
      this.seen});
}


/* NOTIFICATIONS TYPES:

1. page
2. group
3. comment
4. friend
5. security
6. date
7. badge
8-14: reactions: like, haha, love, lovelove, sad, wow, angry
15: memory
 */
