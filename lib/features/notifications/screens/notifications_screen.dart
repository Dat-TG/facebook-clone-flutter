import 'package:facebook/features/notifications/widgets/single_notification.dart';
import 'package:facebook/models/noti.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  static double offset = 0;
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Noti> notifications = [
    Noti(
      content: 'Khánh Vy đã gửi cho bạn lời mời kết bạn',
      bold: ['Khánh Vy'],
      image: 'assets/images/user/khanhvy.jpg',
      time: '5 thg 8 lúc 0:47',
      type: 'friend',
    ),
    Noti(
      content: 'Leo Messi đã nhắc đến bạn trong một bình luận',
      bold: ['Leo Messi'],
      image: 'assets/images/user/messi.jpg',
      time: '18 thg 8 lúc 11:31',
      type: 'comment',
    ),
    Noti(
      content: 'Hôm nay, bạn có thể ôn lại kỷ niệm.',
      image: 'assets/images/memory.png',
      time: '12 giờ trước',
      type: 'memory',
    ),
    Noti(
      content:
          'Trang Đào Xuân Trường... mà bạn theo dõi đã đổi tên thành KHTN Confession',
      image: 'assets/images/user/khtncfs.jpg',
      time: '22 thg 7 lúc 1:39',
      type: 'page',
    ),
  ];

  ScrollController scrollController =
      ScrollController(initialScrollOffset: NotificationsScreen.offset);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      NotificationsScreen.offset = scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
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
                    'Thông báo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
          ...notifications
              .map((e) => SingleNotification(notification: e))
              .toList()
        ],
      ),
    );
  }
}
