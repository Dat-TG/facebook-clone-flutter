import 'dart:math';

import 'package:facebook/features/news-feed/widgets/post_content.dart';
import 'package:facebook/features/news-feed/widgets/single_image.dart';
import 'package:facebook/models/post.dart';
import 'package:flutter/material.dart';

import '../../comment/screens/comment_screen.dart';

class MultipleImagesPostScreen extends StatefulWidget {
  static const String routeName = '/multiple-images';
  final Post post;
  const MultipleImagesPostScreen({super.key, required this.post});

  @override
  State<MultipleImagesPostScreen> createState() =>
      _MultipleImagesPostScreenState();
}

class _MultipleImagesPostScreenState extends State<MultipleImagesPostScreen> {
  List<String> icons = [];
  String reactions = '0';
  final Random random = Random();
  int totalReactions = 0;
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
      if (sum > 0) {
        totalReactions = sum;
      } else {
        totalReactions = 1;
      }
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
      }

      if (list[1] > 0) {
        if (list[1] == widget.post.like &&
            icons[0] != 'assets/images/reactions/like.png') {
          icons.add('assets/images/reactions/like.png');
        } else if (list[1] == widget.post.haha &&
            icons[0] != 'assets/images/reactions/haha.png') {
          icons.add('assets/images/reactions/haha.png');
        } else if (list[1] == widget.post.love &&
            icons[0] != 'assets/images/reactions/love.png') {
          icons.add('assets/images/reactions/love.png');
        } else if (list[1] == widget.post.lovelove &&
            icons[0] != 'assets/images/reactions/care.png') {
          icons.add('assets/images/reactions/care.png');
        } else if (list[1] == widget.post.wow &&
            icons[0] != 'assets/images/reactions/wow.png') {
          icons.add('assets/images/reactions/wow.png');
        } else if (list[1] == widget.post.sad &&
            icons[0] != 'assets/images/reactions/sad.png') {
          icons.add('assets/images/reactions/sad.png');
        } else if (list[1] == widget.post.angry &&
            icons[0] != 'assets/images/reactions/angry.png') {
          icons.add('assets/images/reactions/angry.png');
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black12,
                          width: 0.5,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(widget.post.user.avatar),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Row(
                              children: [
                                Text(
                                  widget.post.user.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                (widget.post.user.verified == true
                                    ? const Padding(
                                        padding: EdgeInsets.only(left: 5),
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
                          SizedBox(
                            width: 65,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.post.time,
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: Icon(
                                    Icons.circle,
                                    size: 2,
                                    color: Colors.black54,
                                  ),
                                ),
                                Icon(
                                  widget.post.shareWith == 'public'
                                      ? Icons.public
                                      : widget.post.shareWith == 'friends'
                                          ? Icons.people
                                          : widget.post.shareWith ==
                                                  'friends-of-frends'
                                              ? Icons.groups
                                              : Icons.lock,
                                  color: Colors.black54,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                color: Colors.grey[400],
                height: 1.5,
                width: double.infinity,
              ),
              PostContent(text: widget.post.content!),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 5,
                ),
                color: Colors.grey[400],
                height: 0.5,
                width: double.infinity,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CommentScreen.routeName,
                    arguments: widget.post,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 42,
                            child: Stack(
                              children: [
                                const SizedBox(
                                  width: 24,
                                  height: 24,
                                ),
                                if (icons.length > 1)
                                  Positioned(
                                    top: 2,
                                    left: 18,
                                    child: Image.asset(
                                      icons[1],
                                      width: 20,
                                    ),
                                  ),
                                if (icons.isNotEmpty)
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
                          if (reactions != '0')
                            Text(
                              reactions,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          widget.post.comment != null
                              ? Text(
                                  '${widget.post.comment} bình luận',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                )
                              : const SizedBox(),
                          (widget.post.comment != null &&
                                  widget.post.share != null)
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(
                                    Icons.circle,
                                    size: 3,
                                    color: Colors.black,
                                  ),
                                )
                              : const SizedBox(),
                          widget.post.share != null
                              ? Text(
                                  '${widget.post.share} lượt chia sẻ',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                ),
                color: Colors.grey[400],
                height: 0.25,
                width: double.infinity,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 11.5,
                      ),
                      alignment: Alignment.centerLeft,
                      width: (MediaQuery.of(context).size.width) / 3,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage(
                              'assets/images/like.png',
                            ),
                            color: Colors.black,
                            size: 24,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Thích',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      alignment: Alignment.center,
                      width: (MediaQuery.of(context).size.width) / 3,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage('assets/images/comment.png'),
                            color: Colors.black,
                            size: 22,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Bình luận',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      alignment: Alignment.centerRight,
                      width: (MediaQuery.of(context).size.width) / 3,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage('assets/images/share.png'),
                            color: Colors.black,
                            size: 27,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Chia sẻ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: 5,
                color: Colors.black26,
              ),
              for (int i = 0; i < widget.post.image!.length; i++)
                Column(
                  children: [
                    SingleImage(
                      post: widget.post.copyWith(
                        image: [widget.post.image![i]],
                        like: random.nextInt(
                          totalReactions ~/ 70,
                        ),
                        love: random.nextInt(
                          totalReactions ~/ 70,
                        ),
                        lovelove: random.nextInt(
                          totalReactions ~/ 70,
                        ),
                        sad: random.nextInt(
                          totalReactions ~/ 70,
                        ),
                        wow: random.nextInt(
                          totalReactions ~/ 70,
                        ),
                        angry: random.nextInt(
                          totalReactions ~/ 70,
                        ),
                        haha: random.nextInt(
                          totalReactions ~/ 70,
                        ),
                        comment: random.nextInt(
                          (widget.post.comment ?? 0) ~/
                              widget.post.image!.length ~/
                              2,
                        ),
                        share: random.nextInt(
                          (widget.post.share ?? 0) ~/
                              widget.post.image!.length ~/
                              2,
                        ),
                        content: '',
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 5,
                      color: Colors.black26,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
