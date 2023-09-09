import 'package:flutter/material.dart';

import '../../../models/user.dart';

class FriendsSuggestScreen extends StatefulWidget {
  static const String routeName = '/friends-suggest-screen';
  const FriendsSuggestScreen({super.key});

  @override
  State<FriendsSuggestScreen> createState() => _FriendsSuggestScreenState();
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

class _FriendsSuggestScreenState extends State<FriendsSuggestScreen> {
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
      user: User(
        name: 'Nguyễn Thị Minh Tuyền',
        avatar: 'assets/images/user/minhtuyen.jpg',
      ),
      time: '2 năm',
    ),
    FriendRequest(
      user: User(
        name: 'Hà Linhh',
        avatar: 'assets/images/user/halinh.jpg',
      ),
      time: '4 năm',
    ),
    FriendRequest(
      user: User(
        name: 'Bảo Ngân',
        avatar: 'assets/images/user/baongan.jpg',
      ),
      time: '5 năm',
    ),
    FriendRequest(
      user: User(
        name: 'Doraemon',
        avatar: 'assets/images/user/doraemon.jpg',
      ),
      time: '1 tuần',
    ),
    FriendRequest(
      user: User(
        name: 'Minh Trí',
        avatar: 'assets/images/user/minhtri.jpg',
      ),
      time: '4 tuần',
    ),
    FriendRequest(
      user: User(
        name: 'Sách Cũ Ngọc',
        avatar: 'assets/images/user/sachcungoc.jpg',
      ),
      time: '1 tuần',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.5),
              child: Container(
                color: Colors.black12,
                height: 0.5,
              )),
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
                'Gợi ý',
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
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
                top: 15,
                bottom: 15,
              ),
              child: Text(
                'Những người bạn có thể biết',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            for (int i = 0; i < friends.length; i++)
              Padding(
                padding: const EdgeInsets.all(10),
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
                        radius: 46,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                friends[i].user.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                friends[i].time,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          if (friends[i].mutualFriends != null &&
                              friends[i].mutualFriends! > 0)
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 2,
                              ),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      friends[i].f2 != null
                                          ? const SizedBox(
                                              width: 46,
                                              height: 28,
                                            )
                                          : const SizedBox(
                                              width: 28,
                                              height: 28,
                                            ),
                                      if (friends[i].f2 != null)
                                        Positioned(
                                          left: 22,
                                          top: 2,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                friends[i].f2!.avatar),
                                            radius: 12,
                                          ),
                                        ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                friends[i].f1!.avatar),
                                            radius: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${friends[i].mutualFriends} bạn chung',
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
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.transparent,
                                    backgroundColor: Colors.blue[700],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Thêm bạn bè',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.transparent,
                                    backgroundColor: Colors.grey[300],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Gỡ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
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
