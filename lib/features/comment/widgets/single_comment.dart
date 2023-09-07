import 'dart:math';

import 'package:facebook/models/comment.dart';
import 'package:flutter/material.dart';

class SingleComment extends StatefulWidget {
  final Comment comment;
  final int level;
  const SingleComment({super.key, required this.comment, required this.level});

  @override
  State<SingleComment> createState() => _SingleCommentState();
}

Size _textSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}

class _SingleCommentState extends State<SingleComment> {
  List<String> icons = [];
  String reactions = '0';
  bool viewReplies = false;

  @override
  void initState() {
    super.initState();
    List<int> list = [
      widget.comment.like != null ? widget.comment.like! : 0,
      widget.comment.haha != null ? widget.comment.haha! : 0,
      widget.comment.love != null ? widget.comment.love! : 0,
      widget.comment.lovelove != null ? widget.comment.lovelove! : 0,
      widget.comment.wow != null ? widget.comment.wow! : 0,
      widget.comment.sad != null ? widget.comment.sad! : 0,
      widget.comment.angry != null ? widget.comment.angry! : 0
    ];
    list.sort((a, b) => b - a);
    int sum = 0;
    for (int i = 0; i < list.length; i++) {
      sum += list[i];
    }
    setState(() {
      reactions = '';
      String tmp = sum.toString();
      int x = 0;
      for (int i = tmp.length - 1; i > 0; i--) {
        x++;
        reactions = '${tmp[i]}$reactions';
        if (x == 3) reactions = '.$reactions';
      }
      reactions = '${tmp[0]}$reactions';
      icons = [];
      if (list[0] > 0) {
        if (list[0] == widget.comment.like) {
          icons.add('assets/images/reactions/like.png');
        } else if (list[0] == widget.comment.haha) {
          icons.add('assets/images/reactions/haha.png');
        } else if (list[0] == widget.comment.love) {
          icons.add('assets/images/reactions/love.png');
        } else if (list[0] == widget.comment.lovelove) {
          icons.add('assets/images/reactions/care.png');
        } else if (list[0] == widget.comment.wow) {
          icons.add('assets/images/reactions/wow.png');
        } else if (list[0] == widget.comment.sad) {
          icons.add('assets/images/reactions/sad.png');
        } else if (list[0] == widget.comment.angry) {
          icons.add('assets/images/reactions/angry.png');
        }
      }

      if (list[1] > 0) {
        if (list[1] == widget.comment.like &&
            icons[0] != 'assets/images/reactions/like.png') {
          icons.add('assets/images/reactions/like.png');
        } else if (list[1] == widget.comment.haha &&
            icons[0] != 'assets/images/reactions/haha.png') {
          icons.add('assets/images/reactions/haha.png');
        } else if (list[1] == widget.comment.love &&
            icons[0] != 'assets/images/reactions/love.png') {
          icons.add('assets/images/reactions/love.png');
        } else if (list[1] == widget.comment.lovelove &&
            icons[0] != 'assets/images/reactions/care.png') {
          icons.add('assets/images/reactions/care.png');
        } else if (list[1] == widget.comment.wow &&
            icons[0] != 'assets/images/reactions/wow.png') {
          icons.add('assets/images/reactions/wow.png');
        } else if (list[1] == widget.comment.sad &&
            icons[0] != 'assets/images/reactions/sad.png') {
          icons.add('assets/images/reactions/sad.png');
        } else if (list[1] == widget.comment.angry &&
            icons[0] != 'assets/images/reactions/angry.png') {
          icons.add('assets/images/reactions/angry.png');
        }
      }

      if (list[2] > 0) {
        if (list[2] == widget.comment.like &&
            !icons.contains('assets/images/reactions/like.png')) {
          icons.add('assets/images/reactions/like.png');
        } else if (list[2] == widget.comment.haha &&
            !icons.contains('assets/images/reactions/haha.png')) {
          icons.add('assets/images/reactions/haha.png');
        } else if (list[2] == widget.comment.love &&
            !icons.contains('assets/images/reactions/love.png')) {
          icons.add('assets/images/reactions/love.png');
        } else if (list[2] == widget.comment.lovelove &&
            !icons.contains('assets/images/reactions/care.png')) {
          icons.add('assets/images/reactions/care.png');
        } else if (list[2] == widget.comment.wow &&
            !icons.contains('assets/images/reactions/wow.png')) {
          icons.add('assets/images/reactions/wow.png');
        } else if (list[2] == widget.comment.sad &&
            !icons.contains('assets/images/reactions/sad.png')) {
          icons.add('assets/images/reactions/sad.png');
        } else if (list[2] == widget.comment.angry &&
            !icons.contains('assets/images/reactions/angry.png')) {
          icons.add('assets/images/reactions/angry.png');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.level == 0
          ? const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            )
          : EdgeInsets.only(
              left: widget.level == 1 ? 45 : 45 + (widget.level - 1) * 35,
              top: 5,
              bottom: 5,
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 0.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.comment.user.avatar),
                  radius: widget.level > 0 ? 15 : 20,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              (widget.comment.content.isNotEmpty)
                  ? Container(
                      width: min(
                        MediaQuery.of(context).size.width -
                            15 * 2 -
                            20 * 2 -
                            5 -
                            35 * widget.level,
                        _textSize(
                              widget.comment.content,
                              const TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.visible,
                              ),
                            ).width +
                            20,
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.comment.user.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              (widget.comment.user.verified == true
                                  ? const Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Icon(
                                        Icons.verified,
                                        color: Colors.blue,
                                        size: 15,
                                      ),
                                    )
                                  : const SizedBox()),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.comment.content,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.comment.user.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          (widget.comment.user.verified == true
                              ? const Padding(
                                  padding: EdgeInsets.only(left: 2),
                                  child: Icon(
                                    Icons.verified,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                )
                              : const SizedBox()),
                        ],
                      ),
                    ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          if (widget.comment.image != null)
            Padding(
              padding: EdgeInsets.only(
                bottom: 5,
                left: widget.level == 0 ? 45 : 45 + widget.level * 35,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.comment.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: widget.level == 0 ? 50 : 40,
              ),
              Text(
                widget.comment.time,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Thích',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Phản hồi',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              if (reactions != '0')
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      reactions,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 60,
                      child: Stack(
                        children: [
                          const SizedBox(
                            width: 24,
                            height: 24,
                          ),
                          if (icons.length > 2)
                            Positioned(
                              top: 2,
                              left: 38,
                              child: Image.asset(
                                icons[2],
                                width: 20,
                              ),
                            ),
                          if (icons.length > 1)
                            Positioned(
                              top: 0,
                              left: 18,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    )),
                                child: Image.asset(
                                  icons[1],
                                  width: 20,
                                ),
                              ),
                            ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  )),
                              child: Image.asset(
                                icons[0],
                                width: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
          if (widget.comment.replies.isNotEmpty && !viewReplies)
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 40),
              child: InkWell(
                onTap: () {
                  setState(() {
                    viewReplies = true;
                  });
                },
                child: Text(
                  'Xem ${widget.comment.replies.length} phản hồi',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          if (viewReplies)
            for (int i = 0; i < widget.comment.replies.length; i++)
              SingleComment(
                comment: widget.comment.replies[i],
                level: widget.level + 1,
              ),
        ],
      ),
    );
  }
}
