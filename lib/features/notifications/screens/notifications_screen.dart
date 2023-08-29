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
      image:
          'https://scontent.fsgn5-15.fna.fbcdn.net/v/t39.30808-6/338423090_919574289246218_5183699940984081337_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=8zCRZSa4eiIAX8194a_&_nc_ht=scontent.fsgn5-15.fna&oh=00_AfCNKgvuFSCmuPyQUfdAdp8QSNFlefpSUMi4CqxnyE9MJA&oe=64F1C835',
      time: '5 thg 8 lúc 0:47',
      type: 'friend',
    ),
    Noti(
      content: 'Leo Messi đã nhắc đến bạn trong một bình luận',
      bold: ['Leo Messi'],
      image:
          'https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.6435-9/199385759_345470910277839_3988273979229903886_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=FTyqeQblOfwAX-FFjg3&_nc_oc=AQl_2O2Y5wyHBzzZWkVM-eNz_tTih9gh7CLX4LQMlj29g6JFY3A3cnTa6sL0WOPPh5eBePREmVImMIsuLaFSmI4J&_nc_ht=scontent.fsgn5-15.fna&oh=00_AfD2xWWU5pJTdfMEjsNlOvKhkfoAXVNKQ0ITDIxAKjwkTg&oe=65142FCF',
      time: '18 thg 8 lúc 11:31',
      type: 'comment',
    ),
    Noti(
      content: 'Hôm nay, bạn có thể ôn lại kỷ niệm.',
      image: 'https://static.xx.fbcdn.net/rsrc.php/v3/yH/r/JEtA5GKG9IF.png',
      time: '12 giờ trước',
      type: 'memory',
    ),
    Noti(
      content:
          'Trang Đào Xuân Trường... mà bạn theo dõi đã đổi tên thành KHTN Confession',
      image:
          'https://scontent.fsgn5-10.fna.fbcdn.net/v/t39.30808-6/302566291_509233427875126_6545553749625388494_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=ln5zrAeiLI0AX8BXA5p&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfD57RdW3H3m31dM06IstkEmFaby46qcArVPwBVy_C-vvQ&oe=64F234DC',
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
