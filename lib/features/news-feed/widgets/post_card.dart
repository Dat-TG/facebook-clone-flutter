import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

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
  double leftImageHeight = 0;
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
    _calculateImageDimension();
  }

  _calculateImageDimension() async {
    Completer<Size> completer = Completer();
    Image image = Image.asset(widget.post.image![0]);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );
    await completer.future.then((value) {
      setState(() {
        if (widget.post.image!.length > 2 && widget.post.image!.length < 5) {
          leftImageHeight = MediaQuery.of(context).size.width *
              2 /
              3 *
              0.99 *
              value.height /
              value.width;
        } else {
          leftImageHeight = MediaQuery.of(context).size.width /
              2 *
              0.99 *
              value.height /
              value.width;
        }
      });
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
        if (widget.post.layout != 'quote')
          PostContent(text: widget.post.content!),
        Container(
          width: double.infinity,
          color: widget.post.layout == 'frame'
              ? Colors.black.withOpacity(0.1)
              : Colors.white,
          padding: EdgeInsets.all(widget.post.layout == 'frame' ? 10 : 0),
          child: ((widget.post.video != null ? widget.post.video!.length : 0) +
                      (widget.post.image != null
                          ? widget.post.image!.length
                          : 0) ==
                  1)
              ? Image.asset((widget.post.image != null)
                  ? widget.post.image![0]
                  : widget.post.video![0])
              : widget.post.layout == 'classic'
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              widget.post.image![0],
                              width: (widget.post.image!.length > 2 &&
                                      widget.post.image!.length < 5)
                                  ? MediaQuery.of(context).size.width *
                                      2 /
                                      3 *
                                      0.99
                                  : MediaQuery.of(context).size.width /
                                      2 *
                                      0.99,
                              height: widget.post.image!.length >= 5
                                  ? leftImageHeight / 2 -
                                      MediaQuery.of(context).size.width /
                                          2 *
                                          0.005
                                  : leftImageHeight,
                              fit: BoxFit.cover,
                            ),
                            if (widget.post.image!.length >= 5)
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.width /
                                        2 *
                                        0.01),
                                child: Image.asset(
                                  widget.post.image![1],
                                  width: MediaQuery.of(context).size.width /
                                      2 *
                                      0.99,
                                  height: leftImageHeight / 2 -
                                      MediaQuery.of(context).size.width /
                                          2 *
                                          0.005,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(
                          width: widget.post.image!.length > 2 &&
                                  widget.post.image!.length < 5
                              ? MediaQuery.of(context).size.width * 2 / 3 * 0.01
                              : MediaQuery.of(context).size.width / 2 * 0.02,
                        ),
                        ((widget.post.video != null
                                        ? widget.post.video!.length
                                        : 0) +
                                    (widget.post.image != null
                                        ? widget.post.image!.length
                                        : 0) >
                                1)
                            ? Column(
                                children: [
                                  for (int i =
                                          widget.post.image!.length < 5 ? 1 : 2;
                                      i < min(widget.post.image!.length, 5);
                                      i++)
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 0,
                                        bottom: i <
                                                widget.post.image!.length - 1
                                            ? widget.post.image!.length > 2 &&
                                                    widget.post.image!.length <
                                                        5
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    2 /
                                                    3 *
                                                    0.01
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 *
                                                    0.01
                                            : 0,
                                      ),
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            widget.post.image![i],
                                            width: widget.post.image!.length >
                                                        2 &&
                                                    widget.post.image!.length <
                                                        5
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 *
                                                    0.99,
                                            height: i <
                                                    widget.post.image!.length -
                                                        1
                                                ? widget.post.image!.length < 5
                                                    ? leftImageHeight /
                                                            (widget.post.image!
                                                                    .length -
                                                                1) -
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            2 /
                                                            3 *
                                                            0.01
                                                    : leftImageHeight / 3 -
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2 *
                                                            0.01
                                                : widget.post.image!.length < 5
                                                    ? leftImageHeight /
                                                        (widget.post.image!
                                                                .length -
                                                            1)
                                                    : leftImageHeight / 3,
                                            fit: BoxFit.cover,
                                          ),
                                          if (i == 4 &&
                                              widget.post.image!.length > 5)
                                            Positioned.fill(
                                              child: Center(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  color: Colors.black
                                                      .withOpacity(0.3),
                                                  child: Text(
                                                    '+${widget.post.image!.length - i - 1}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    )
                  : widget.post.layout == 'column'
                      ? Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.all(0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border.symmetric(
                              horizontal:
                                  BorderSide(color: Colors.black12, width: 0.5),
                            ),
                          ),
                          child: Row(
                            children: [
                              for (int i = 0;
                                  i < min(widget.post.image!.length, 4);
                                  i++)
                                Padding(
                                  padding: i % 2 == 0
                                      ? i <
                                              min(widget.post.image!.length,
                                                      4) -
                                                  1
                                          ? EdgeInsets.only(
                                              right: 3,
                                              bottom:
                                                  widget.post.image!.length > 2
                                                      ? 10
                                                      : 0,
                                            )
                                          : EdgeInsets.only(
                                              bottom:
                                                  widget.post.image!.length > 2
                                                      ? 10
                                                      : 0,
                                            )
                                      : i <
                                              min(widget.post.image!.length,
                                                      4) -
                                                  1
                                          ? EdgeInsets.only(
                                              right: 3,
                                              top: widget.post.image!.length > 2
                                                  ? 10
                                                  : 0,
                                            )
                                          : EdgeInsets.only(
                                              top: widget.post.image!.length > 2
                                                  ? 10
                                                  : 0,
                                            ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          widget.post.image![i],
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  (min(
                                                              widget.post.image!
                                                                  .length,
                                                              4) -
                                                          1) *
                                                      3) /
                                              (min(widget.post.image!.length,
                                                  4)),
                                          fit: BoxFit.cover,
                                          height: min(leftImageHeight, 300),
                                        ),
                                        if (i == 3 &&
                                            widget.post.image!.length > 4)
                                          Positioned.fill(
                                            child: Center(
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: double.infinity,
                                                height: double.infinity,
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                child: Text(
                                                  '+${widget.post.image!.length - i - 1}',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        )
                      : widget.post.layout == 'quote'
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Image.asset(
                                    widget.post.image![0],
                                    width: double.infinity,
                                    height: min(200, leftImageHeight),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  widget.post.content!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      for (int i = 1;
                                          i < min(widget.post.image!.length, 5);
                                          i++)
                                        Padding(
                                          padding: i % 2 == 0
                                              ? i <
                                                      min(
                                                              widget.post.image!
                                                                  .length,
                                                              5) -
                                                          1
                                                  ? const EdgeInsets.only(
                                                      right: 5,
                                                    )
                                                  : EdgeInsets.zero
                                              : i <
                                                      min(
                                                              widget.post.image!
                                                                  .length,
                                                              5) -
                                                          1
                                                  ? const EdgeInsets.only(
                                                      right: 5,
                                                    )
                                                  : EdgeInsets.zero,
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                widget.post.image![i],
                                                width: (MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        20 -
                                                        (min(
                                                                    widget
                                                                        .post
                                                                        .image!
                                                                        .length,
                                                                    5) -
                                                                2) *
                                                            5) /
                                                    (min(
                                                            widget.post.image!
                                                                .length,
                                                            5) -
                                                        1),
                                                fit: BoxFit.cover,
                                                height:
                                                    min(leftImageHeight, 200),
                                              ),
                                              if (i == 4 &&
                                                  widget.post.image!.length > 5)
                                                Positioned.fill(
                                                  child: Center(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      color: Colors.black
                                                          .withOpacity(0.3),
                                                      child: Text(
                                                        '+${widget.post.image!.length - i - 1}',
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          : Image.asset(widget.post.image![0]),
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
