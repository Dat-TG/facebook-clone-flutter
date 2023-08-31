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
        seen: true),
    Noti(
        content:
            'Trang Đào Xuân Trường... mà bạn theo dõi đã đổi tên thành KHTN Confession',
        image: 'assets/images/user/khtncfs.jpg',
        time: '22 thg 7 lúc 1:39',
        type: 'page',
        bold: ['Đào Xuân Trường', 'KHTN Confession'],
        seen: true),
    Noti(
        content:
            'Một quản trị viên đã thay đổi tên của nhóm 2K5 Quyết Đỗ Đại Học thành 2K6 Quyết Đỗ Đại Học',
        image: 'assets/images/user/ddh.png',
        time: '21 thg 8 lúc 15:45',
        type: 'group',
        bold: ['2K5 Quyết Đỗ Đại Học', '2K6 Quyết Đỗ Đại Học'],
        seen: true),
    Noti(
      content:
          'Vào 11:45, 8 tháng 8, 2023, bạn đã đăng nhập vào TopCV. Nếu đó không phải bạn thì bạn có thể gỡ ứng dụng này.',
      image: 'assets/images/user/lcd.jpg',
      time: '8 thg 8 lúc 11:45',
      type: 'security',
    ),
    Noti(
      content:
          'Người hẹn hò không nhìn thấy trang cá nhân vì không hoạt động. Truy cập phần Hẹn hò để được quảng cáo miễn phí!',
      image: 'assets/images/dating.jpg',
      time: '12 thg 8 lúc 0:02',
      type: 'date',
    ),
    Noti(
      content:
          'Bạn đã nhận được huy hiệu fan cứng vì là một trong những người theo dõi sôi nổi nhất của Trung Tâm Hỗ Trợ Sinh Viên - Trường ĐH. Khoa Học Tự Nhiên, ĐHQG-HCM.',
      image: 'assets/images/user/tthtsv.jpg',
      time: '9 thg 8 lúc 21:04',
      type: 'badge',
      bold: [
        'Trung Tâm Hỗ Trợ Sinh Viên - Trường ĐH. Khoa Học Tự Nhiên, ĐHQG-HCM'
      ],
    ),
    Noti(
      content:
          'Khánh Vy và 454 người khác đã bày tỏ cảm xúc về một ảnh: #ChienBinhAndroid #ComposeCamp Profile: https://g.dev/datle Chi tiết: https://goo.gle/ChienbinhAndroid',
      image: 'assets/images/user/khanhvy.jpg',
      time: '1 thg 8 lúc 8:37',
      type: 'like',
      bold: ['Khánh Vy'],
    ),
    Noti(
      content:
          'Minh Hương và 2002 người khác đã bày tỏ cảm xúc về một bài viết: #QuanQuanGCP5 #CloudStudyJam Link profile: https://www.cloudskillsboost.google/.../4465a5ac-14b5... Link event: goo.gle/quanquanGCP5',
      image: 'assets/images/user/minhhuong.jpg',
      time: '4 thg 7 lúc 20:13',
      type: 'love',
      bold: ['Minh Hương'],
    ),
    Noti(
        content: 'Minh Trí và 1310 người khác đã bày tỏ cảm xúc về một ảnh.',
        image: 'assets/images/user/minhtri.jpg',
        time: '1 thg 7 lúc 10:20',
        type: 'haha',
        bold: ['Minh Trí'],
        seen: true),
    Noti(
        content:
            'Vuong Hong Thuy và 100 người khác đã bày tỏ cảm xúc về một ảnh.',
        image: 'assets/images/user/vuonghongthuy.jpg',
        time: '30 thg 6 lúc 11:21',
        type: 'sad',
        bold: ['Vuong Hong Thuy'],
        seen: true),
    Noti(
      content:
          'Nguyễn Thị Minh Tuyền và 99 người khác đã bày tỏ cảm xúc về một ảnh.',
      image: 'assets/images/user/minhtuyen.jpg',
      time: '29 thg 6 lúc 01:23',
      type: 'lovelove',
      bold: ['Nguyễn Thị Minh Tuyền'],
    ),
    Noti(
        content: 'Hà Linhh và 199 người khác đã bày tỏ cảm xúc về một ảnh.',
        image: 'assets/images/user/halinh.jpg',
        time: '25 thg 6 lúc 07:44',
        type: 'wow',
        bold: ['Hà Linhh'],
        seen: true),
    Noti(
        content: 'Bảo Ngân và 299 người khác đã bày tỏ cảm xúc về một ảnh.',
        image: 'assets/images/user/baongan.jpg',
        time: '21 thg 6 lúc 08:22',
        type: 'angry',
        bold: ['Bảo Ngân'],
        seen: true),
  ];

  ScrollController scrollController =
      ScrollController(initialScrollOffset: NotificationsScreen.offset);
  ScrollController headerScrollController = ScrollController();

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
          NotificationsScreen.offset);
      NotificationsScreen.offset = scrollController.offset;
    });
    return Scaffold(
      body: NestedScrollView(
        controller: headerScrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarHeight: 50,
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
            ),
          )
        ],
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: notifications
                .map((e) => SingleNotification(notification: e))
                .toList(),
          ),
        ),
      ),
    );
  }
}
