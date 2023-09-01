import 'package:facebook/features/news-feed/widgets/post_content.dart';
import 'package:facebook/models/post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  List<String> icons = [];
  String reactions = '0';
  @override
  void initState() {
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(widget.post.user.avatar),
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
              Row(
                children: [
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded),
                  ),
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: PostContent(text: widget.post.content!),
        ),
        Image.asset(
          widget.post.image![0],
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 8,
            left: 10,
            right: 10,
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
                      color: Colors.black54,
                      fontSize: 14,
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
                            color: Colors.black54,
                          ),
                        )
                      : const SizedBox(),
                  (widget.post.comment != null && widget.post.share != null)
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.circle,
                            size: 3,
                            color: Colors.black54,
                          ),
                        )
                      : const SizedBox(),
                  widget.post.share != null
                      ? Text(
                          '${widget.post.share} lượt chia sẻ',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            color: Colors.black38,
            height: 0,
          ),
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
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width) / 3,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage('assets/images/like.png'),
                      size: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Thích',
                        style: TextStyle(
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
                      size: 22,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Bình luận',
                        style: TextStyle(
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
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width) / 3,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage('assets/images/share.png'),
                      size: 27,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Chia sẻ',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
