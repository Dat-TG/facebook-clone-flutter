import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  static Duration videoDuration = Duration.zero;
  final String video;

  const VideoPlayerScreen({super.key, required this.video});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    controller = VideoPlayerController.asset(widget.video)
      ..initialize().then((value) {
        setState(() {
          controller.setVolume(1.0);
          controller.play();
          VideoPlayerScreen.videoDuration =
              controller.value.duration + const Duration(milliseconds: 500);
        });
      });
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    controller.dispose();
    VideoPlayerScreen.videoDuration = Duration.zero;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: 9 / 16,
            child: VideoPlayer(controller),
          )
        : const CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 5,
          );
  }
}
