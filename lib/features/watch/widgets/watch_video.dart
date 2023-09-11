import 'package:facebook/features/news-feed/widgets/post_content.dart';
import 'package:facebook/features/watch/screens/watch_others_screen.dart';
import 'package:facebook/features/watch/screens/watch_screen.dart';
import 'package:facebook/models/post.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'controls_overlay.dart';

// ignore: must_be_immutable
class WatchVideo extends StatefulWidget {
  final Post post;
  final GlobalKey videoKey;
  VideoControllerWrapper controller;
  bool? autoPlay;
  bool? isDarkMode;
  bool? noDispose;
  WatchVideo({
    super.key,
    required this.post,
    required this.videoKey,
    required this.controller,
    this.autoPlay,
    this.isDarkMode,
    this.noDispose,
  });

  @override
  State<WatchVideo> createState() => _WatchVideoState();
}

class _WatchVideoState extends State<WatchVideo> {
  late List<String> icons = [];
  String reactions = '0';
  @override
  void initState() {
    super.initState();
    if (widget.controller.value == null ||
        (widget.controller.value != null &&
            !widget.controller.value!.value.isInitialized)) {
      widget.controller.value =
          VideoPlayerController.asset(widget.post.video![0])
            ..initialize().then((value) {
              setState(() {
                widget.controller.value?.setVolume(1.0);
                if (widget.autoPlay == true) {
                  if (WatchScreen.offset == 0) {
                    widget.controller.value?.play();
                  }
                }
              });
            });
    } else {
      widget.controller.value?.play();
    }
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
  void dispose() {
    if (widget.noDispose == null || widget.noDispose == false) {
      widget.controller.value?.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.isDarkMode == true
          ? Colors.black.withOpacity(0.85)
          : Colors.white,
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
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
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: widget.isDarkMode == true
                                        ? Colors.white
                                        : Colors.black,
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
                            width: 115,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.post.time,
                                  style: TextStyle(
                                    color: widget.isDarkMode == true
                                        ? Colors.white.withOpacity(0.5)
                                        : Colors.black54,
                                    fontSize: 14,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                    left: 5,
                                    right: 5,
                                  ),
                                  child: Icon(
                                    Icons.circle,
                                    size: 2,
                                    color: widget.isDarkMode == true
                                        ? Colors.white.withOpacity(0.5)
                                        : Colors.black54,
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
                                  color: widget.isDarkMode == true
                                      ? Colors.white.withOpacity(0.5)
                                      : Colors.black54,
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
                      icon: Icon(
                        Icons.more_horiz_rounded,
                        color: widget.isDarkMode == true
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    IconButton(
                      splashRadius: 20,
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: widget.isDarkMode == true
                            ? Colors.white
                            : Colors.black54,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: PostContent(
              text: widget.post.content!,
              textColor:
                  widget.isDarkMode == true ? Colors.white : Colors.black,
            ),
          ),
          widget.controller.value!.value.isInitialized
              ? GestureDetector(
                  onTap: () {
                    if (widget.isDarkMode == null ||
                        widget.isDarkMode == false) {
                      widget.controller.value!.pause();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WatchOthersScreen(
                            controllerInit: widget.controller,
                            postInit: widget.post,
                          ),
                        ),
                      );
                    }
                  },
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: widget.controller.value!.value.aspectRatio,
                        child: Stack(
                          children: [
                            VideoPlayer(
                              widget.controller.value!,
                              key: widget.videoKey,
                            ),
                            if (widget.isDarkMode == true)
                              ControlsOverlay(
                                  controller: widget.controller.value!),
                          ],
                        ),
                      ),
                      if (widget.isDarkMode == null ||
                          widget.isDarkMode == false)
                        Positioned(
                          top: 5,
                          right: 5,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.picture_in_picture_alt_rounded,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      if (widget.isDarkMode == null ||
                          widget.isDarkMode == false)
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (widget.controller.value!.value.volume > 0) {
                                  widget.controller.value!.setVolume(0);
                                } else {
                                  widget.controller.value!.setVolume(1.0);
                                }
                              });
                            },
                            icon: widget.controller.value!.value.volume > 0
                                ? const Icon(
                                    Icons.volume_up_outlined,
                                    color: Colors.white,
                                    size: 25,
                                  )
                                : const Icon(
                                    Icons.volume_off_outlined,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                          ),
                        ),
                    ],
                  ),
                )
              : const CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 5,
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
                                    color: widget.isDarkMode == true
                                        ? Colors.black.withOpacity(0.85)
                                        : Colors.white,
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
                      style: TextStyle(
                        color: widget.isDarkMode == true
                            ? Colors.white
                            : Colors.black54,
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
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: widget.isDarkMode == true
                                  ? Colors.white
                                  : Colors.black54,
                            ),
                          )
                        : const SizedBox(),
                    (widget.post.comment != null && widget.post.share != null)
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.circle,
                              size: 3,
                              color: widget.isDarkMode == true
                                  ? Colors.white
                                  : Colors.black54,
                            ),
                          )
                        : const SizedBox(),
                    widget.post.share != null
                        ? Text(
                            '${widget.post.share} lượt chia sẻ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: widget.isDarkMode == true
                                  ? Colors.white
                                  : Colors.black54,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: widget.isDarkMode == true ? Colors.white : Colors.black38,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        const AssetImage('assets/images/like.png'),
                        size: 24,
                        color: widget.isDarkMode == true
                            ? Colors.white
                            : Colors.black54,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Thích',
                          style: TextStyle(
                            fontSize: 15,
                            color: widget.isDarkMode == true
                                ? Colors.white
                                : Colors.black54,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        const AssetImage('assets/images/comment.png'),
                        size: 22,
                        color: widget.isDarkMode == true
                            ? Colors.white
                            : Colors.black54,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Bình luận',
                          style: TextStyle(
                            fontSize: 15,
                            color: widget.isDarkMode == true
                                ? Colors.white
                                : Colors.black54,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        const AssetImage('assets/images/share.png'),
                        size: 27,
                        color: widget.isDarkMode == true
                            ? Colors.white
                            : Colors.black54,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Chia sẻ',
                          style: TextStyle(
                            fontSize: 15,
                            color: widget.isDarkMode == true
                                ? Colors.white
                                : Colors.black54,
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
      ),
    );
  }
}
