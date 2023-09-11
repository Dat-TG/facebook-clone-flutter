import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ControlsOverlay extends StatefulWidget {
  const ControlsOverlay({super.key, required this.controller});

  final VideoPlayerController controller;

  @override
  State<ControlsOverlay> createState() => _ControlsOverlayState();
}

class _ControlsOverlayState extends State<ControlsOverlay> {
  Duration curPosition = const Duration(seconds: 0);
  bool isPlaying = false;
  double speed = 1.0;
  final speedVideoLists = <double>[0.5, 0.75, 1, 1.25, 1.5, 1.75, 2];

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        curPosition = widget.controller.value.position;
        isPlaying = widget.controller.value.isPlaying;
      });
    });
  }

  Timer? t;

  @override
  void dispose() {
    t?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            t?.cancel();
            t = Timer(
              const Duration(seconds: 3),
              () => setState(() => t = null),
            );
          },
        ),
        isPlaying
            ? (t != null)
                ? GestureDetector(
                    onTap: () {
                      if (t != null) {
                        setState(() {
                          t?.cancel();
                          t = null;
                        });
                      }
                    },
                    child: Container(
                      color: Colors.black26,
                      child: GestureDetector(
                        onTap: () {
                          t?.cancel();
                          widget.controller.pause();
                        },
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                            child: const Icon(
                              Icons.pause_rounded,
                              color: Colors.white,
                              size: 50,
                              semanticLabel: 'Pause',
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          t = Timer(
                            const Duration(seconds: 3),
                            () => setState(() => t = null),
                          );
                        });
                      },
                    ),
                  )
            : (t != null)
                ? GestureDetector(
                    onTap: () {
                      if (t != null) {
                        setState(() {
                          t?.cancel();
                          t = null;
                        });
                      }
                    },
                    child: Container(
                      color: Colors.black26,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            widget.controller.play();
                            t = Timer(
                              const Duration(seconds: 1),
                              () => setState(() => t = null),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                            ),
                            child: const Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 50,
                              semanticLabel: 'Play',
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    color: Colors.transparent,
                    child: Center(
                      child: GestureDetector(onTap: () {
                        setState(() {
                          t = Timer(
                            const Duration(days: 365),
                            () => setState(() => t = null),
                          );
                        });
                      }),
                    ),
                  ),
        if (t != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${curPosition.inMinutes}:${(curPosition.inSeconds - curPosition.inMinutes * 60).toString().padLeft(2, '0')} / ${widget.controller.value.duration.inMinutes}:${(widget.controller.value.duration.inSeconds - widget.controller.value.duration.inMinutes * 60).toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor:
                                      const Color.fromRGBO(37, 37, 38, 1),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 30,
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            shape: BoxShape.rectangle,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {},
                                            child: ListTile(
                                              titleAlignment:
                                                  ListTileTitleAlignment.center,
                                              tileColor: const Color.fromRGBO(
                                                  37, 37, 38, 1),
                                              minLeadingWidth: 10,
                                              leading: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromRGBO(
                                                      62, 62, 66, 1),
                                                ),
                                                child: const Icon(
                                                  Icons.closed_caption_rounded,
                                                  size: 25,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              title: const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Phụ đề',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Không có phụ đề',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {},
                                            child: ListTile(
                                              titleAlignment:
                                                  ListTileTitleAlignment.center,
                                              tileColor: const Color.fromRGBO(
                                                  37, 37, 38, 1),
                                              minLeadingWidth: 10,
                                              leading: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 14,
                                                ),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromRGBO(
                                                      62, 62, 66, 1),
                                                ),
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 3,
                                                    vertical: 1,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                  ),
                                                  child: const Icon(
                                                      Icons.play_arrow,
                                                      size: 15,
                                                      color: Color.fromRGBO(
                                                          37, 37, 38, 1)),
                                                ),
                                              ),
                                              title: const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Chất lượng',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Tự động',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {},
                                            child: ListTile(
                                              titleAlignment:
                                                  ListTileTitleAlignment.center,
                                              tileColor: const Color.fromRGBO(
                                                  37, 37, 38, 1),
                                              minLeadingWidth: 10,
                                              leading: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromRGBO(
                                                      62, 62, 66, 1),
                                                ),
                                                child: const Icon(
                                                  Icons.phone_android_rounded,
                                                  size: 25,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              title: const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Trình tiết kiệm dữ liệu',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Đang tắt',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  context: context,
                                                  backgroundColor:
                                                      const Color.fromRGBO(
                                                          37, 37, 38, 1),
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                  )),
                                                  builder: (context) {
                                                    return StatefulBuilder(
                                                      builder: (context,
                                                              setStateLocal) =>
                                                          Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              width: 30,
                                                              height: 3,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey[300],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                IconButton(
                                                                  splashColor: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.5),
                                                                  splashRadius:
                                                                      20,
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .arrow_back_rounded,
                                                                    size: 25,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                const Text(
                                                                  'Tốc độ phát lại',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 40,
                                                                ),
                                                              ],
                                                            ),
                                                            for (int i = 0;
                                                                i <
                                                                    speedVideoLists
                                                                        .length;
                                                                i++)
                                                              Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child: InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      ListTile(
                                                                    titleAlignment:
                                                                        ListTileTitleAlignment
                                                                            .center,
                                                                    tileColor:
                                                                        const Color.fromRGBO(
                                                                            37,
                                                                            37,
                                                                            38,
                                                                            1),
                                                                    minLeadingWidth:
                                                                        10,
                                                                    leading: speed ==
                                                                            speedVideoLists[
                                                                                i]
                                                                        ? const Icon(
                                                                            Icons.check,
                                                                            size:
                                                                                25,
                                                                            color:
                                                                                Colors.white,
                                                                          )
                                                                        : const SizedBox(
                                                                            width:
                                                                                25),
                                                                    title: Text(
                                                                      '${speedVideoLists[i]}${speedVideoLists[i] == 1 ? ' (Bình thường)' : ''}',
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                    onTap: () {
                                                                      setStateLocal(
                                                                          () {
                                                                        speed =
                                                                            speedVideoLists[i];
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        speed =
                                                                            speedVideoLists[i];
                                                                        widget
                                                                            .controller
                                                                            .setPlaybackSpeed(speed);
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                          ]),
                                                    );
                                                  });
                                            },
                                            child: ListTile(
                                              titleAlignment:
                                                  ListTileTitleAlignment.center,
                                              tileColor: const Color.fromRGBO(
                                                  37, 37, 38, 1),
                                              minLeadingWidth: 10,
                                              leading: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromRGBO(
                                                      62, 62, 66, 1),
                                                ),
                                                child: const Icon(
                                                  Icons.directions_run_rounded,
                                                  size: 25,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Tốc độ phát lại',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    speed == 1
                                                        ? 'Bình thường'
                                                        : '$speed',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              splashRadius: 20,
                              splashColor: Colors.white.withOpacity(0.5),
                              icon: const Icon(
                                Icons.settings_rounded,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (widget.controller.value.volume > 0) {
                                  widget.controller.setVolume(0);
                                } else {
                                  widget.controller.setVolume(1.0);
                                }
                              });
                            },
                            icon: widget.controller.value.volume > 0
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
                          const SizedBox(
                            width: 10,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: IconButton(
                              splashRadius: 20,
                              splashColor: Colors.white.withOpacity(0.5),
                              onPressed: () {},
                              icon: const ImageIcon(
                                AssetImage('assets/images/expand.png'),
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                VideoProgressIndicator(
                  widget.controller,
                  colors: VideoProgressColors(
                    backgroundColor: Colors.white.withOpacity(0.1),
                    bufferedColor: Colors.white.withOpacity(0.1),
                    playedColor: Colors.white,
                  ),
                  allowScrubbing: true,
                ),
              ],
            ),
          )
      ],
    );
  }
}
