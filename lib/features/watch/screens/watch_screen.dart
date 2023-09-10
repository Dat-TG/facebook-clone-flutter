import 'package:facebook/features/watch/widgets/watch_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

import '../../../models/post.dart';
import '../../../models/user.dart';

class WatchScreen extends StatefulWidget {
  static double offset = 0;
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class VideoControllerWrapper {
  VideoPlayerController? value;
  VideoControllerWrapper(this.value);
}

class _WatchScreenState extends State<WatchScreen> {
  ScrollController scrollController =
      ScrollController(initialScrollOffset: WatchScreen.offset);
  ScrollController headerScrollController = ScrollController();
  int index = 0;
  List<VideoControllerWrapper> videoController = [];
  final posts = [
    Post(
      user: User(name: 'Aki Michio', avatar: 'assets/images/user/aki.jpg'),
      time: '14 thg 7, 2022',
      shareWith: 'public',
      content: 'Kawaiii quá vậy\nAnime : Con của mẹ kế là bạn gái cũ',
      like: 15000,
      angry: 3,
      comment: 210,
      haha: 3000,
      love: 1100,
      lovelove: 78,
      sad: 36,
      share: 98,
      wow: 18,
      video: ['assets/videos/4.mp4'],
    ),
    Post(
      user: User(
          name: 'Đài Phát Thanh.',
          avatar: 'assets/images/user/daiphatthanh.jpg'),
      time: '17 thg 1, 2021',
      shareWith: 'public',
      content:
          'Bên anh đến khi già nếu anh cũng muốn ta cùng già ..\n-\nGià Cùng Anh Nếu Anh Cũng Muốn Già Cùng Em\nHIỀN MAI / Live Session…',
      like: 12000,
      angry: 1,
      comment: 902,
      haha: 21,
      love: 2100,
      lovelove: 67,
      sad: 20,
      share: 98,
      wow: 5,
      video: ['assets/videos/5.mp4'],
    ),
    Post(
      user: User(name: 'Spezon', avatar: 'assets/images/user/spezon.jpg'),
      time: '27 tháng 8',
      shareWith: 'public',
      content: 'Lionel Messi World cup Champion [Messi EP. FINAL]',
      like: 4100,
      angry: 1,
      comment: 72,
      haha: 21,
      love: 888,
      lovelove: 100,
      sad: 20,
      share: 98,
      wow: 5,
      video: ['assets/videos/6.mp4'],
    ),
  ];
  List<GlobalKey> key = [];

  @override
  void initState() {
    super.initState();
    videoController =
        List.generate(posts.length, (index) => VideoControllerWrapper(null));
    key = List.generate(
        posts.length, (index) => GlobalKey(debugLabel: index.toString()));
  }

  @override
  void dispose() {
    scrollController.dispose();
    headerScrollController.dispose();
    /*for (int i = 0; i < videoController.length; i++) {
      videoController[i].value?.dispose();
    }*/
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      headerScrollController.jumpTo(headerScrollController.offset +
          scrollController.offset -
          WatchScreen.offset);
      WatchScreen.offset = scrollController.offset;
    });
    return Scaffold(
      body: NestedScrollView(
        controller: headerScrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarHeight: 120,
            titleSpacing: 0,
            pinned: true,
            floating: true,
            primary: false,
            centerTitle: true,
            automaticallyImplyLeading: false,
            snap: true,
            forceElevated: innerBoxIsScrolled,
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(0), child: SizedBox()),
            title: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            splashRadius: 20,
                            onPressed: () {},
                            icon: const ImageIcon(
                              AssetImage('assets/images/menu.png'),
                              color: Colors.black,
                              size: 50,
                            ),
                          ),
                          const Text(
                            'Video',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 35,
                            height: 35,
                            padding: const EdgeInsets.all(0),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black12,
                            ),
                            child: IconButton(
                              splashRadius: 18,
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.person_rounded,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 35,
                            height: 35,
                            padding: const EdgeInsets.all(0),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black12,
                            ),
                            child: IconButton(
                              splashRadius: 18,
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                setState(() {
                                  index = 0;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                decoration: (index == 0)
                                    ? BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                      )
                                    : const BoxDecoration(),
                                child: Text(
                                  'Dành cho bạn',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: index == 0
                                        ? Colors.blue[800]
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                setState(() {
                                  index = 1;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                decoration: (index == 1)
                                    ? BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                      )
                                    : const BoxDecoration(),
                                child: Text(
                                  'Trực tiếp',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: index == 1
                                        ? Colors.blue[800]
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                setState(() {
                                  index = 2;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                decoration: (index == 2)
                                    ? BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                      )
                                    : const BoxDecoration(),
                                child: Text(
                                  'Chơi game',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: index == 2
                                        ? Colors.blue[800]
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                setState(() {
                                  index = 3;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                decoration: (index == 3)
                                    ? BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                      )
                                    : const BoxDecoration(),
                                child: Text(
                                  'Reels',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: index == 3
                                        ? Colors.blue[800]
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                setState(() {
                                  index = 4;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                decoration: (index == 4)
                                    ? BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                      )
                                    : const BoxDecoration(),
                                child: Text(
                                  'Đang theo dõi',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: index == 4
                                        ? Colors.blue[800]
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scroll) {
            for (int i = 0; i < posts.length; i++) {
              var currentContext = key[i].currentContext;
              if (currentContext == null) continue;

              var renderObject = currentContext.findRenderObject();
              RenderAbstractViewport viewport =
                  RenderAbstractViewport.of(renderObject);
              var offsetToRevealBottom =
                  viewport.getOffsetToReveal(renderObject!, 1.0);
              var offsetToRevealTop =
                  viewport.getOffsetToReveal(renderObject, 0.0);

              if (offsetToRevealBottom.offset > scroll.metrics.pixels ||
                  scroll.metrics.pixels > offsetToRevealTop.offset) {
                //print('$i out of viewport');
              } else {
                //print('$i in viewport');
                if (videoController[i].value != null) {
                  if (videoController[i].value!.value.isInitialized) {
                    videoController[i].value!.play();
                  }
                }
              }
            }
            return false;
          },
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 5,
                      color: Colors.black26,
                    ),
                    ...posts.asMap().entries.map((e) {
                      return Column(
                        children: [
                          WatchVideo(
                            post: e.value,
                            videoKey: key[e.key],
                            controller: videoController[e.key],
                            autoPlay: e.key == 0,
                          ),
                          Container(
                            width: double.infinity,
                            height: 5,
                            color: Colors.black26,
                          ),
                        ],
                      );
                    }).toList(),
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
