import 'dart:async';
import 'dart:ui';

import 'package:facebook/features/news-feed/widgets/video_screen.dart';
import 'package:facebook/models/story.dart';
import 'package:flutter/material.dart';

class StoryDetails extends StatefulWidget {
  static const String routeName = '/story-details';
  final Story story;
  const StoryDetails({super.key, required this.story});

  @override
  State<StoryDetails> createState() => _StoryDetailsState();
}

class _StoryDetailsState extends State<StoryDetails>
    with TickerProviderStateMixin {
  List<double> progress = [];
  int index = 0;
  Timer? _timer;
  bool buttonClick = false;
  ScrollController scrollController = ScrollController();
  late AnimationController videoProgressController;
  bool showFilter = true;
  bool isInWidgetTree = true;
  @override
  void initState() {
    for (int i = 0;
        i <
            (widget.story.image != null ? widget.story.image!.length : 0) +
                (widget.story.video != null ? widget.story.video!.length : 0);
        i++) {
      progress.add(0);
    }
    const oneSec = Duration(milliseconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (mounted) {
        if (index >=
            (widget.story.image != null ? widget.story.image!.length : 0)) {
          return;
        }
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
    scrollController.addListener(() {
      if (scrollController.offset > 0) {
        if (index < widget.story.image!.length) _timer?.cancel();
      } else {
        if (index < widget.story.image!.length) {
          if (_timer == null || (_timer != null && !_timer!.isActive)) {
            setState(() {
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
            });
          }
        }
      }
    });
    videoProgressController = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(microseconds: 1),
    )..addListener(() {
        setState(() {
          if (index >=
              (widget.story.image != null ? widget.story.image!.length : 0)) {
            if (VideoPlayerScreen.videoDuration.compareTo(Duration.zero) > 0) {
              videoProgressController.duration =
                  VideoPlayerScreen.videoDuration;
            }
          }
          if (videoProgressController.value > 0.99) {
            videoProgressController.value = 0;
            if (index < progress.length - 1) {
              index++;
            } else {
              index = 0;
              for (int i = 0; i < progress.length; i++) {
                progress[i] = 0;
              }
            }
          }
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    videoProgressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (index >=
        (widget.story.image != null ? widget.story.image!.length : 0)) {
      videoProgressController.repeat();
    }
    return isInWidgetTree
        ? Dismissible(
            key: const Key('story-details'),
            direction: DismissDirection.down,
            onUpdate: (details) {
              if (details.progress == 0) {
                setState(() {
                  showFilter = true;
                });
              } else {
                setState(() {
                  showFilter = false;
                });
              }
            },
            onDismissed: (direction) {
              setState(() {
                isInWidgetTree = false;
              });
              Navigator.pop(context);
            },
            child: GestureDetector(
              onTapDown: (details) {
                if (buttonClick) return;
                if (details.localPosition.dx >=
                    MediaQuery.of(context).size.width / 2) {
                  setState(() {
                    videoProgressController.value = 0;
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
                    videoProgressController.value = 0;
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
              child: Scaffold(
                backgroundColor: Colors.black,
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Container(
                    decoration: (index <
                                (widget.story.image != null
                                    ? widget.story.image!.length
                                    : 0) &&
                            showFilter)
                        ? BoxDecoration(
                            image: DecorationImage(
                              image:
                                  ExactAssetImage(widget.story.image![index]),
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                    child: Stack(
                      children: [
                        if (index <
                            (widget.story.image != null
                                ? widget.story.image!.length
                                : 0))
                          if (showFilter)
                            BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.1)),
                              ),
                            ),
                        (index >=
                                (widget.story.image != null
                                    ? widget.story.image!.length
                                    : 0))
                            ? Center(
                                key: Key(index.toString()),
                                child: VideoPlayerScreen(
                                  video: widget.story.video![index -
                                      (widget.story.image != null
                                          ? widget.story.image!.length
                                          : 0)],
                                ),
                              )
                            : Center(
                                key: Key(index.toString()),
                                child: Image.asset(widget.story.image![index]),
                              ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      for (int i = 0;
                                          i <
                                              (widget.story.image != null
                                                  ? widget.story.image!.length
                                                  : 0);
                                          i++)
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          child: LinearProgressIndicator(
                                            backgroundColor:
                                                Colors.grey.withOpacity(0.4),
                                            color: Colors.white,
                                            value: progress[i],
                                            minHeight: 2,
                                          ),
                                        )),
                                      if (widget.story.video != null)
                                        for (int i = 0;
                                            i < widget.story.video!.length;
                                            i++)
                                          Expanded(
                                              child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2),
                                            child: LinearProgressIndicator(
                                              backgroundColor:
                                                  Colors.grey.withOpacity(0.4),
                                              color: Colors.white,
                                              value: (index -
                                                          (widget.story.image !=
                                                                  null
                                                              ? widget.story
                                                                  .image!.length
                                                              : 0) ==
                                                      i)
                                                  ? videoProgressController
                                                      .value
                                                  : (index -
                                                              (widget.story
                                                                          .image !=
                                                                      null
                                                                  ? widget
                                                                      .story
                                                                      .image!
                                                                      .length
                                                                  : 0) >
                                                          i)
                                                      ? 1
                                                      : 0,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTapUp: (details) {
                                                setState(() {
                                                  buttonClick = false;
                                                });
                                              },
                                              onTapDown: (details) {
                                                setState(() {
                                                  buttonClick = true;
                                                });
                                              },
                                              onTapCancel: () {
                                                setState(() {
                                                  buttonClick = false;
                                                });
                                              },
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    widget.story.user.avatar),
                                                radius: 20,
                                              ),
                                            ),
                                            Container(
                                              constraints: const BoxConstraints(
                                                maxWidth: 150,
                                              ),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
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
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Icon(
                                                widget.story.shareWith ==
                                                        'public'
                                                    ? Icons.public
                                                    : widget.story.shareWith ==
                                                            'friends'
                                                        ? Icons.people
                                                        : widget.story
                                                                    .shareWith ==
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTapUp: (details) {
                                                  setState(() {
                                                    buttonClick = false;
                                                  });
                                                },
                                                onTapDown: (details) {
                                                  setState(() {
                                                    buttonClick = true;
                                                  });
                                                },
                                                onTapCancel: () {
                                                  setState(() {
                                                    buttonClick = false;
                                                  });
                                                },
                                                child: IconButton(
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    splashColor: Colors.white,
                                                    splashRadius: 20,
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.more_horiz_rounded,
                                                      size: 25,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTapUp: (details) {
                                                  setState(() {
                                                    buttonClick = false;
                                                  });
                                                },
                                                onTapDown: (details) {
                                                  setState(() {
                                                    buttonClick = true;
                                                  });
                                                },
                                                onTapCancel: () {
                                                  setState(() {
                                                    buttonClick = false;
                                                  });
                                                },
                                                child: IconButton(
                                                    padding:
                                                        const EdgeInsets.all(0),
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
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTapUp: (details) {
                                  setState(() {
                                    buttonClick = false;
                                  });
                                },
                                onTapDown: (details) {
                                  setState(() {
                                    buttonClick = true;
                                  });
                                },
                                onTapCancel: () {
                                  setState(() {
                                    buttonClick = false;
                                  });
                                },
                                child: SingleChildScrollView(
                                  controller: scrollController,
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          onTap: () {},
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color:
                                                  Colors.black.withOpacity(0.2),
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
                                                    AssetImage(
                                                        'assets/images/message.png'),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Image.asset(
                                          'assets/images/reactions/like.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Image.asset(
                                          'assets/images/reactions/love.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Image.asset(
                                          'assets/images/reactions/care.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Image.asset(
                                          'assets/images/reactions/haha.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Image.asset(
                                          'assets/images/reactions/wow.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Image.asset(
                                          'assets/images/reactions/sad.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Image.asset(
                                          'assets/images/reactions/angry.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
