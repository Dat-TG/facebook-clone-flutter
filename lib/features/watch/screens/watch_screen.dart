import 'package:flutter/material.dart';

class WatchScreen extends StatefulWidget {
  static double offset = 0;
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  ScrollController scrollController =
      ScrollController(initialScrollOffset: WatchScreen.offset);
  ScrollController headerScrollController = ScrollController();
  int index = 0;

  @override
  void dispose() {
    scrollController.dispose();
    headerScrollController.dispose();
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
        body: SingleChildScrollView(),
      ),
    );
  }
}
