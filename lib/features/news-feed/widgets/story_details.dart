import 'dart:async';
import 'dart:ui';

import 'package:facebook/models/story.dart';
import 'package:flutter/material.dart';

class StoryDetails extends StatefulWidget {
  static const String routeName = '/story-details';
  final Story story;
  const StoryDetails({super.key, required this.story});

  @override
  State<StoryDetails> createState() => _StoryDetailsState();
}

class _StoryDetailsState extends State<StoryDetails> {
  List<double> progress = [];
  int index = 0;
  Timer? _timer;
  @override
  void initState() {
    for (int i = 0;
        i <
            widget.story.image.length +
                (widget.story.video != null ? widget.story.video!.length : 0);
        i++) {
      progress.add(0);
    }
    const oneSec = Duration(milliseconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (mounted) {
        setState(() {
          if (progress[index] < 1) {
            progress[index] += 0.0002;
          } else {
            if (index < progress.length - 1) {
              progress[index + 1] += 0.0002;
              index++;
            }
          }
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) {
          if (details.localPosition.direction < 1.0) {
            setState(() {
              progress[index] = 1;
              if (index < progress.length - 1) {
                progress[index + 1] = 0;
                index++;
              } else {
                progress[0] = 0;
                index = 0;
              }
            });
          } else {
            setState(() {
              progress[index] = 0;
              if (index > 0) {
                progress[index - 1] = 0;
                index--;
              } else {
                progress[progress.length - 1] = 0;
                index = progress.length - 1;
              }
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(widget.story.image[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.1)),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        for (int i = 0;
                            i <
                                widget.story.image.length +
                                    (widget.story.video != null
                                        ? widget.story.video!.length
                                        : 0);
                            i++)
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey.withOpacity(0.4),
                              color: Colors.white,
                              value: progress[i],
                              minHeight: 2,
                            ),
                          )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                        bottom: 10,
                        right: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(widget.story.user.avatar),
                                radius: 20,
                              ),
                              Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 150,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  widget.story.user.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Text(
                                widget.story.time[0],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(
                                  widget.story.shareWith == 'public'
                                      ? Icons.public
                                      : widget.story.shareWith == 'friends'
                                          ? Icons.people
                                          : widget.story.shareWith ==
                                                  'friends-of-frends'
                                              ? Icons.groups
                                              : Icons.lock,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    splashColor: Colors.white,
                                    splashRadius: 20,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_horiz_rounded,
                                      size: 25,
                                      color: Colors.white,
                                    )),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    splashColor: Colors.white,
                                    splashRadius: 20,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.close_rounded,
                                      size: 25,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Image.asset(widget.story.image[index]),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {},
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 10,
                                    right: 50,
                                  ),
                                  child: Row(
                                    children: [
                                      ImageIcon(
                                        AssetImage('assets/images/message.png'),
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Gửi tin nhắn...',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/reactions/like.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/reactions/love.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/reactions/care.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/reactions/haha.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/reactions/wow.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/reactions/sad.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/reactions/angry.png',
                              width: 40,
                              height: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}