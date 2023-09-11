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
                              onPressed: () {},
                              splashRadius: 20,
                              splashColor: Colors.white.withOpacity(0.5),
                              icon: Icon(
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
                              icon: ImageIcon(
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
