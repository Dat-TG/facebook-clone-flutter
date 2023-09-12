import 'package:facebook/features/friends/screens/friends_screen.dart';
import 'package:facebook/features/menu/widgets/menu_choice.dart';
import 'package:facebook/features/menu/widgets/shortcut.dart';
import 'package:facebook/models/user.dart';
import 'package:flutter/material.dart';

import '../../memory/screens/memory_screen.dart';
import '../../personal-page/screens/personal_page_screen.dart';

class MenuScreen extends StatefulWidget {
  static double offset = 0;
  static bool viewMoreShortcuts = false;
  static bool viewMoreHelps = false;
  static bool viewMoreSettings = false;
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  ScrollController scrollController =
      ScrollController(initialScrollOffset: MenuScreen.offset);
  ScrollController headerScrollController = ScrollController();
  User user = User(name: 'Lê Công Đắt', avatar: 'assets/images/user/lcd.jpg');
  User secondUser =
      User(name: 'Leo Messi', avatar: 'assets/images/user/messi.jpg');
  final List<Widget> shortcuts = [
    Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.black12,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            ),
          ]),
      child:
          const Shortcut(img: 'assets/images/menu/avatar.png', title: 'Avatar'),
    ),
    Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black12,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: const Shortcut(
          img: 'assets/images/menu/game.png', title: 'Chơi game'),
    ),
    Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.black12,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            ),
          ]),
      child: const Shortcut(
          img: 'assets/images/menu/order.png',
          title: 'Đơn đặt hàng và thanh toán'),
    ),
    Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black12,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: const Shortcut(
          img: 'assets/images/menu/badge.png', title: 'Game giả tưởng'),
    ),
    Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.black12,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            ),
          ]),
      child: const Shortcut(
          img: 'assets/images/menu/messenger-kid.png', title: 'Messenger Kids'),
    ),
    Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black12,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: const Shortcut(
          img: 'assets/images/menu/ads.png',
          title: 'Hoạt động quảng cáo gần đây'),
    ),
    Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.black12,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            ),
          ]),
      child: const Shortcut(img: 'assets/images/menu/group.png', title: 'Nhóm'),
    ),
    Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black12,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child:
          const Shortcut(img: 'assets/images/menu/reels.png', title: 'Reels'),
    ),
    Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.black12,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            ),
          ]),
      child: const Shortcut(img: 'assets/images/menu/page.png', title: 'Trang'),
    ),
    Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black12,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: const Shortcut(
          img: 'assets/images/menu/emergency.png', title: 'Ứng phó khẩn cấp'),
    ),
    Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.black12,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            ),
          ]),
      child: const Shortcut(
          img: 'assets/images/menu/phone.png', title: 'Yêu cầu từ thiết bị'),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

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
          MenuScreen.offset);
      MenuScreen.offset = scrollController.offset;
    });
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: NestedScrollView(
        controller: headerScrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 60,
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
              child: Row(
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
                        'Menu',
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
                            Icons.settings_rounded,
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
            ),
          )
        ],
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PersonalPageScreen.routeName,
                    arguments: user,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black12,
                                width: 1,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(user.avatar),
                              radius: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Xem trang cá nhân của bạn',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(secondUser.avatar),
                          radius: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.black12,
                indent: 10,
                endIndent: 10,
                height: 0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: Text(
                  'Lối tắt của bạn',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 30,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/images/user/tthtsv.jpg',
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black12,
                                        width: 0.5,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Image.asset(
                                      'assets/images/menu/page.png',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                            child: Text(
                              'Trung Tâm Hỗ Trợ Sinh Viên - Trường ĐH. Khoa học Tự nhiên, ĐHQG-HCM',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 80,
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 30,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/images/user/goal.png',
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black12,
                                        width: 0.5,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Image.asset(
                                      'assets/images/menu/page.png',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                            child: Text(
                              'GOAL Vietnam',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 80,
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 30,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.asset(
                                            'assets/images/user/minhhuong.jpg',
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black12,
                                        width: 0.5,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Image.asset(
                                      'assets/images/menu/friends.png',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                            child: Text(
                              'Minh Hương',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 80,
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 30,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.asset(
                                            'assets/images/menu/chat.png',
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black12,
                                        width: 0.5,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Image.asset(
                                      'assets/images/menu/messenger.png',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                            child: Text(
                              'Typescript',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 80,
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 30,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.asset(
                                            'assets/images/user/baongan.jpg',
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black12,
                                        width: 0.5,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Image.asset(
                                      'assets/images/menu/friends.png',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                            child: Text(
                              'Bảo Ngân',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 80,
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 30,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.asset(
                                            'assets/images/user/halinh.jpg',
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black12,
                                        width: 0.5,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Image.asset(
                                      'assets/images/menu/friends.png',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                            child: Text(
                              'Hà Linhh',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 80,
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 30,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.asset(
                                            'assets/images/user/minhtuyen.jpg',
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black12,
                                        width: 0.5,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Image.asset(
                                      'assets/images/menu/friends.png',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                            child: Text(
                              'Nguyễn Thị Minh Tuyền',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 80,
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 30,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/images/user/daiphatthanh.jpg',
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black12,
                                        width: 0.5,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Image.asset(
                                      'assets/images/menu/page.png',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                            child: Text(
                              'Đài phát thanh',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                ),
                child: Text(
                  'Tất cả lối tắt',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 0),
                                    spreadRadius: 0,
                                  ),
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, MemoryScreen.routeName);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Shortcut(
                                      img: 'assets/images/menu/memory.png',
                                      title: 'Kỷ niệm'),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 0),
                                    spreadRadius: 0,
                                  ),
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, FriendsScreen.routeName);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Shortcut(
                                      img: 'assets/images/menu/friends.png',
                                      title: 'Bạn bè'),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 0),
                                    spreadRadius: 0,
                                  ),
                                ]),
                            child: const Shortcut(
                                img: 'assets/images/menu/video.png',
                                title: 'Video'),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 0),
                                    spreadRadius: 0,
                                  ),
                                ]),
                            child: const Shortcut(
                                img: 'assets/images/menu/feed.png',
                                title: 'Bảng feed'),
                          ),
                          if (MenuScreen.viewMoreShortcuts)
                            for (int i = 0; i < shortcuts.length; i += 2)
                              shortcuts[i],
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.black12,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 20,
                                  offset: const Offset(0, 0),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: const Shortcut(
                                img: 'assets/images/menu/saved.png',
                                title: 'Đã lưu'),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.black12,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 20,
                                  offset: const Offset(0, 0),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: const Shortcut(
                                img: 'assets/images/menu/dating.png',
                                title: 'Hẹn hò'),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.black12,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 20,
                                  offset: const Offset(0, 0),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: const Shortcut(
                                img: 'assets/images/menu/market.png',
                                title: 'Marketplace'),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.black12,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 20,
                                  offset: const Offset(0, 0),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: const Shortcut(
                                img: 'assets/images/menu/event.png',
                                title: 'Sự kiện'),
                          ),
                          if (MenuScreen.viewMoreShortcuts)
                            for (int i = 1; i < shortcuts.length; i += 2)
                              shortcuts[i],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          shadowColor: Colors.transparent,
                          side: const BorderSide(
                            color: Colors.black12,
                            width: 0.5,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            MenuScreen.viewMoreShortcuts =
                                !MenuScreen.viewMoreShortcuts;
                          });
                        },
                        child: Text(
                          MenuScreen.viewMoreShortcuts ? 'Ẩn bớt' : 'Xem thêm',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
                color: Colors.black12,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    MenuScreen.viewMoreHelps = !MenuScreen.viewMoreHelps;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/menu/help.png',
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Trợ giúp & hỗ trợ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Icon(
                          MenuScreen.viewMoreHelps
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          size: 30,
                          color: Colors.grey),
                    ],
                  ),
                ),
              ),
              if (MenuScreen.viewMoreHelps)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.black12,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 0),
                                spreadRadius: 0,
                              ),
                            ]),
                        child: const MenuChoice(
                            img: 'assets/images/menu/center.png',
                            title: 'Trung tâm trợ giúp'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.black12,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 0),
                                spreadRadius: 0,
                              ),
                            ]),
                        child: const MenuChoice(
                            img: 'assets/images/menu/mail.png',
                            title: 'Hộp thư hỗ trợ'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.black12,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 0),
                                spreadRadius: 0,
                              ),
                            ]),
                        child: const MenuChoice(
                            img: 'assets/images/menu/problem.png',
                            title: 'Báo cáo sự cố'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.black12,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 0),
                                spreadRadius: 0,
                              ),
                            ]),
                        child: const MenuChoice(
                            img: 'assets/images/menu/safe.png',
                            title: 'An toàn'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.black12,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 0),
                                spreadRadius: 0,
                              ),
                            ]),
                        child: const MenuChoice(
                            img: 'assets/images/menu/policy.png',
                            title: 'Điều khoản & chính sách'),
                      ),
                    ],
                  ),
                ),
              const Divider(
                height: 0,
                color: Colors.black12,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    MenuScreen.viewMoreSettings = !MenuScreen.viewMoreSettings;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/menu/settings.png',
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Cài đặt & quyền riêng tư',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Icon(
                          MenuScreen.viewMoreSettings
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          size: 30,
                          color: Colors.grey),
                    ],
                  ),
                ),
              ),
              if (MenuScreen.viewMoreSettings)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.black12,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 0),
                                spreadRadius: 0,
                              ),
                            ]),
                        child: const MenuChoice(
                            img: 'assets/images/menu/settings2.png',
                            title: 'Cài đặt'),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          shadowColor: Colors.transparent,
                          side: const BorderSide(
                            color: Colors.black12,
                            width: 0.5,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Đăng xuất',
                          style: TextStyle(
                            color: Colors.black,
                          ),
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
    );
  }
}
