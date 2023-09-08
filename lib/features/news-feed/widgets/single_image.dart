import 'package:flutter/material.dart';

import '../../../models/post.dart';
import '../../comment/screens/comment_screen.dart';
import '../screen/image_fullscreen.dart';

class SingleImage extends StatelessWidget {
  final Post post;
  const SingleImage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    List<String> icons = [];
    String reactions = '0';
    List<int> list = [
      post.like != null ? post.like! : 0,
      post.haha != null ? post.haha! : 0,
      post.love != null ? post.love! : 0,
      post.lovelove != null ? post.lovelove! : 0,
      post.wow != null ? post.wow! : 0,
      post.sad != null ? post.sad! : 0,
      post.angry != null ? post.angry! : 0
    ];
    list.sort((a, b) => b - a);
    int sum = 0;
    for (int i = 0; i < list.length; i++) {
      sum += list[i];
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
      if (list[0] == post.like) {
        icons.add('assets/images/reactions/like.png');
      } else if (list[0] == post.haha) {
        icons.add('assets/images/reactions/haha.png');
      } else if (list[0] == post.love) {
        icons.add('assets/images/reactions/love.png');
      } else if (list[0] == post.lovelove) {
        icons.add('assets/images/reactions/care.png');
      } else if (list[0] == post.wow) {
        icons.add('assets/images/reactions/wow.png');
      } else if (list[0] == post.sad) {
        icons.add('assets/images/reactions/sad.png');
      } else if (list[0] == post.angry) {
        icons.add('assets/images/reactions/angry.png');
      }
    }

    if (list[1] > 0) {
      if (list[1] == post.like &&
          icons[0] != 'assets/images/reactions/like.png') {
        icons.add('assets/images/reactions/like.png');
      } else if (list[1] == post.haha &&
          icons[0] != 'assets/images/reactions/haha.png') {
        icons.add('assets/images/reactions/haha.png');
      } else if (list[1] == post.love &&
          icons[0] != 'assets/images/reactions/love.png') {
        icons.add('assets/images/reactions/love.png');
      } else if (list[1] == post.lovelove &&
          icons[0] != 'assets/images/reactions/care.png') {
        icons.add('assets/images/reactions/care.png');
      } else if (list[1] == post.wow &&
          icons[0] != 'assets/images/reactions/wow.png') {
        icons.add('assets/images/reactions/wow.png');
      } else if (list[1] == post.sad &&
          icons[0] != 'assets/images/reactions/sad.png') {
        icons.add('assets/images/reactions/sad.png');
      } else if (list[1] == post.angry &&
          icons[0] != 'assets/images/reactions/angry.png') {
        icons.add('assets/images/reactions/angry.png');
      }
    }
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ImageFullScreen.routeName,
                arguments: post);
          },
          child: Image.asset(
            post.image![0],
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              CommentScreen.routeName,
              arguments: post,
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
                    post.comment != null
                        ? Text(
                            '${post.comment} bình luận',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          )
                        : const SizedBox(),
                    (post.comment != null && post.share != null)
                        ? const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.circle,
                              size: 3,
                              color: Colors.black,
                            ),
                          )
                        : const SizedBox(),
                    post.share != null
                        ? Text(
                            '${post.share} lượt chia sẻ',
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
      ],
    );
  }
}
