import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:facebook/models/post.dart';

class CommentScreen extends StatefulWidget {
  static const String routeName = '/comment-screen';
  final Post post;
  const CommentScreen({super.key, required this.post});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<String> icons = [];
  String reactions = '0';
  bool isInWidgetTree = true;

  @override
  void initState() {
    List<int> list = [
      widget.post.like != null ? widget.post.like! : 0,
      widget.post.haha != null ? widget.post.haha! : 0,
      widget.post.love != null ? widget.post.love! : 0,
      widget.post.lovelove != null ? widget.post.lovelove! : 0,
      widget.post.wow != null ? widget.post.wow! : 0,
      widget.post.sad != null ? widget.post.sad! : 0,
      widget.post.angry != null ? widget.post.angry! : 0
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
      if (list[0] == widget.post.like) {
        icons.add('assets/images/reactions/like.png');
      } else if (list[0] == widget.post.haha) {
        icons.add('assets/images/reactions/haha.png');
      } else if (list[0] == widget.post.love) {
        icons.add('assets/images/reactions/love.png');
      } else if (list[0] == widget.post.lovelove) {
        icons.add('assets/images/reactions/care.png');
      } else if (list[0] == widget.post.wow) {
        icons.add('assets/images/reactions/wow.png');
      } else if (list[0] == widget.post.sad) {
        icons.add('assets/images/reactions/sad.png');
      } else if (list[0] == widget.post.angry) {
        icons.add('assets/images/reactions/angry.png');
      }

      if (list[1] == widget.post.like) {
        icons.add('assets/images/reactions/like.png');
      } else if (list[1] == widget.post.haha) {
        icons.add('assets/images/reactions/haha.png');
      } else if (list[1] == widget.post.love) {
        icons.add('assets/images/reactions/love.png');
      } else if (list[1] == widget.post.lovelove) {
        icons.add('assets/images/reactions/care.png');
      } else if (list[1] == widget.post.wow) {
        icons.add('assets/images/reactions/wow.png');
      } else if (list[1] == widget.post.sad) {
        icons.add('assets/images/reactions/sad.png');
      } else if (list[1] == widget.post.angry) {
        icons.add('assets/images/reactions/angry.png');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isInWidgetTree
        ? Dismissible(
            direction: DismissDirection.down,
            onDismissed: (direction) {
              setState(() {
                isInWidgetTree = false;
              });
              Navigator.pop(context);
            },
            key: const Key('comment-screen'),
            child: SafeArea(
              child: Material(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Stack(
                    children: [
                      BackdropFilter(
                        filter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.darken),
                        child: Container(
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  bottom: 15,
                                  top: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 42,
                                          child: Stack(
                                            children: [
                                              const SizedBox(
                                                width: 24,
                                                height: 24,
                                              ),
                                              Positioned(
                                                top: 2,
                                                left: 18,
                                                child: Image.asset(
                                                  icons[1],
                                                  width: 20,
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
                                        Text(
                                          reactions,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.navigate_next_rounded,
                                          size: 30,
                                          color: Colors.black54,
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      child: Image.asset(
                                        'assets/images/like.png',
                                        width: 22,
                                        height: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height -
                                    70 -
                                    MediaQuery.of(context).padding.vertical,
                                child: SingleChildScrollView(),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
