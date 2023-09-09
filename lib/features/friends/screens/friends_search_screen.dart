import 'dart:math';

import 'package:flutter/material.dart';

import '../../../models/user.dart';

class FriendsSearchScreen extends StatefulWidget {
  static const String routeName = '/friends-search-screen';
  const FriendsSearchScreen({super.key});

  @override
  State<FriendsSearchScreen> createState() => _FriendsSearchScreenState();
}

class FriendRequest {
  final User user;
  final String time;
  final int? mutualFriends;
  final User? f1;
  final User? f2;
  FriendRequest({
    required this.user,
    required this.time,
    this.mutualFriends,
    this.f1,
    this.f2,
  });
}

class _FriendsSearchScreenState extends State<FriendsSearchScreen> {
  final today = DateTime.now();

  final friends = [
    FriendRequest(
      user: User(
        name: 'Minh Hương',
        avatar: 'assets/images/user/minhhuong.jpg',
      ),
      time: '1 tuần',
      mutualFriends: 25,
      f1: User(
        name: 'Khánh Vy',
        avatar: 'assets/images/user/khanhvy.jpg',
      ),
      f2: User(
        name: 'Leo Messi',
        avatar: 'assets/images/user/messi.jpg',
      ),
    ),
    FriendRequest(
      user: User(
        name: 'Khánh Vy',
        avatar: 'assets/images/user/khanhvy.jpg',
      ),
      time: '3 tuần',
      mutualFriends: 1,
      f1: User(
        name: 'Bảo Ngân',
        avatar: 'assets/images/user/baongan.jpg',
      ),
    ),
    FriendRequest(
      mutualFriends: 25,
      user: User(
        name: 'Vương Hồng Thúy',
        avatar: 'assets/images/user/vuonghongthuy.jpg',
      ),
      time: '2 tuần',
    ),
    FriendRequest(
      user: User(
        name: 'Leo Messi',
        avatar: 'assets/images/user/messi.jpg',
      ),
      mutualFriends: 455,
      f1: User(
        name: 'Minh Hương',
        avatar: 'assets/images/user/minhhuong.jpg',
      ),
      f2: User(
        name: 'Hà Linhh',
        avatar: 'assets/images/user/halinh.jpg',
      ),
      time: '2 năm',
    ),
    FriendRequest(
      mutualFriends: 10,
      user: User(
        name: 'Nguyễn Thị Minh Tuyền',
        avatar: 'assets/images/user/minhtuyen.jpg',
      ),
      time: '2 năm',
    ),
    FriendRequest(
      mutualFriends: 66,
      user: User(
        name: 'Hà Linhh',
        avatar: 'assets/images/user/halinh.jpg',
      ),
      time: '4 năm',
    ),
    FriendRequest(
      mutualFriends: 23,
      user: User(
        name: 'Bảo Ngân',
        avatar: 'assets/images/user/baongan.jpg',
      ),
      time: '5 năm',
    ),
    FriendRequest(
      mutualFriends: 12,
      user: User(
        name: 'Doraemon',
        avatar: 'assets/images/user/doraemon.jpg',
      ),
      time: '1 tuần',
    ),
    FriendRequest(
      mutualFriends: 654,
      user: User(
        name: 'Minh Trí',
        avatar: 'assets/images/user/minhtri.jpg',
      ),
      time: '4 tuần',
    ),
    FriendRequest(
      mutualFriends: 123,
      user: User(
        name: 'Sách Cũ Ngọc',
        avatar: 'assets/images/user/sachcungoc.jpg',
      ),
      time: '1 tuần',
    ),
  ];
  final TextEditingController searchController = TextEditingController();
  final Random random = Random();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Column(
              children: [
                Container(
                  color: Colors.black12,
                  height: 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm bạn bè',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                            ),
                            prefixIcon: const Icon(
                              Icons.search_rounded,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignLabelWithHint: true,
                            contentPadding: const EdgeInsets.all(0),
                          ),
                          cursorColor: Colors.black,
                          textAlignVertical: TextAlignVertical.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Bạn bè',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              IconButton(
                onPressed: () {},
                splashRadius: 20,
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 15,
                bottom: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '1.151 bạn bè',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    minLeadingWidth: 10,
                                    leading: ImageIcon(
                                      AssetImage('assets/images/stars.png'),
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      'Mặc định',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    minLeadingWidth: 10,
                                    leading: ImageIcon(
                                      AssetImage('assets/images/sortup.png'),
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      'Bạn bè mới nhất trước tiên',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    minLeadingWidth: 10,
                                    leading: ImageIcon(
                                      AssetImage('assets/images/sortdown.png'),
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      'Bạn bè lâu năm nhất trước tiên',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'Sắp xếp',
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            for (int i = 0; i < friends.length; i++)
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 10,
                  bottom: 10,
                  right: 0,
                ),
                child: Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black12,
                          width: 0.5,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(friends[i].user.avatar),
                        radius: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                friends[i].user.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (friends[i].mutualFriends != null &&
                                  friends[i].mutualFriends! > 0)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                  ),
                                  child: Text(
                                    '${friends[i].mutualFriends} bạn chung',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              DecoratedBox(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Colors.black12,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                    friends[i].user.avatar,
                                                  ),
                                                  radius: 25,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    friends[i].user.name,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Là bạn bè từ tháng ${1 + random.nextInt(12)} năm ${2023 - random.nextInt(15)}',
                                                    style: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.black12,
                                          height: 0.5,
                                          width: double.infinity,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        ListTile(
                                          minLeadingWidth: 10,
                                          leading: const ImageIcon(
                                            AssetImage(
                                                'assets/images/message-outlined.png'),
                                            size: 25,
                                            color: Colors.black,
                                          ),
                                          title: Text(
                                            'Nhắn tin cho ${friends[i].user.name}',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          minLeadingWidth: 10,
                                          leading: const ImageIcon(
                                            AssetImage(
                                                'assets/images/unfollow.png'),
                                            size: 25,
                                            color: Colors.black,
                                          ),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Bỏ theo dõi ${friends[i].user.name}',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text(
                                                'Không nhìn thấy bài viết nữa nhưng vẫn là bạn bè.',
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          minLeadingWidth: 10,
                                          leading: const ImageIcon(
                                            AssetImage(
                                                'assets/images/block.png'),
                                            size: 25,
                                            color: Colors.black,
                                          ),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Chặn trang cá nhân của ${friends[i].user.name}',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${friends[i].user.name} sẽ không thể nhìn thấy bạn hoặc liên hệ với bạn trên Facebook.',
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          minLeadingWidth: 10,
                                          leading: const ImageIcon(
                                            AssetImage(
                                                'assets/images/unfriend.png'),
                                            size: 25,
                                            color: Colors.red,
                                          ),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Hủy kết bạn với ${friends[i].user.name}',
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Hủy kết bạn với ${friends[i].user.name}',
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            padding: const EdgeInsets.all(0),
                            splashRadius: 23,
                            icon: const Icon(
                              Icons.more_horiz_rounded,
                              color: Colors.black87,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
