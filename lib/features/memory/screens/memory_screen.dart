import 'package:facebook/features/news-feed/widgets/post_card.dart';
import 'package:facebook/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/post.dart';

class MemoryScreen extends StatefulWidget {
  static const String routeName = '/memory';
  const MemoryScreen({super.key});

  @override
  State<MemoryScreen> createState() => _MemoryScreenState();
}

class _MemoryScreenState extends State<MemoryScreen> {
  final today = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final posts = [
      Post(
        user: user,
        time: '${today.day} thg ${today.month}, ${today.year - 1}',
        shareWith: 'public',
        content:
            'Rap Việt Mùa 3 (2023) đã tìm ra Top 9 bước vào Chung Kết, hứa hẹn một trận đại chiến cực căng.\n\nTập cuối vòng Bứt Phá Rap Việt Mùa 3 (2023) đã chính thức khép lại và chương trình đã tìm ra 9 gương mặt đầy triển vọng để bước vào vòng Chung Kết tranh ngôi vị quán quân.\n\nKịch tính, cam go và đầy bất ngờ đến tận những giây phút cuối, Huỳnh Công Hiếu của team B Ray đã vượt lên trên 3 đối thủ Yuno BigBoi, Richie D. ICY, gung0cay để giành được tấm vé đầu tiên bước vào Chung Kết cho đội của mình.\n\nỞ bảng F, không hề thua kém người đồng đội cùng team, 24k.Right cũng có được vé vào Chung Kết sau khi hạ gục SMO team Andree Right Hand, Pháp Kiều – team BigDaddy và Tọi đến từ team Thái VG tại bảng F.\n\nKết thúc toàn bộ phần trình diễn của các thí sinh ở vòng Bứt Phá cũng là lúc 3 Giám khảo hội ý để đưa ra quyết định chọn người nhận Nón Vàng của mình để bước tiếp vào đêm Chung Kết Rap Việt Mùa 3 (2023).\n\nNữ giám khảo Suboi quyết định trao nón vàng cho thành viên đội HLV BigDaddy - Pháp Kiều. Tiếp theo, SMO là người được Giám khảo Karik tin tưởng trao nón. Cuối cùng, Giám khảo JustaTee quyết định trao gửi Nón Vàng của mình cho Double2T.\n\nNhư vậy, đội hình Top 9 bước vào Chung kết đã hoàn thiện gồm: Huỳnh Công Hiếu, 24k.Right – Team B Ray; Liu Grace, Mikelodic – Team Thái VG; SMO, Rhyder – Team Andree Right Hand và Pháp Kiều, Double2T, Tez – Team BigDaddy.',
        image: ['assets/images/post/1.jpg'],
        like: 8500,
        angry: 0,
        comment: 902,
        haha: 43,
        love: 2200,
        lovelove: 59,
        sad: 36,
        share: 98,
        wow: 7,
        type: 'memory',
      ),
      Post(
        user: user,
        time: '${today.day} thg ${today.month}, ${today.year - 2}',
        shareWith: 'public',
        content:
            '✅ 10 năm cống hiến cho bóng đá trẻ Việt Nam\n✅ Người đầu tiên đưa Việt Nam tham dự World Cup ở cấp độ U20 🌏🇻🇳\n✅ Giành danh hiệu đầu tiên cùng U23 Việt Nam tại giải U23 Đông Nam Á 2023 🏆\n\nMột người thầy đúng nghĩa với sự tận tụy cống hiến cho sự nghiệp ươm mầm những tương lai của bóng đá nước nhà. Cảm ơn ông, HLV Hoàng Anh Tuấn ❤️\n\n📸 VFF\n\n#goalvietnam #hot #HoangAnhTuan #U23Vietnam',
        image: ['assets/images/post/2.jpg'],
        like: 163,
        love: 24,
        comment: 5,
        type: 'memory',
      ),
      Post(
        user: user,
        time: '${today.day} thg ${today.month}, ${today.year - 3}',
        shareWith: 'public',
        content:
            'Có một nơi luôn mang lại cho mình sự bình yên và ấm áp diệu kỳ, là nơi mà Ông nội đang yên nghỉ cùng các đồng đội. Mỗi lần nhìn vào lá cờ Tổ quốc là thêm một lần mình nhớ Ông. Mỗi lần nhìn lên bầu trời, là thêm một lần mình chào Ông nội. Chắc bởi Ông đã hoá thân vào núi sống, mây trời của đất nước đã từ rất lâu trước khi mình được sinh ra trên cõi đời này.\n\nMình vẫn hay tự nhủ với bản thân rằng: Trong hành trình trưởng thành, sẽ có những lúc mệt mỏi yếu đuối, những khi chán ghét cuộc sống, nhưng mong bản thân hãy luôn nhớ rằng từng thớ thịt, từng dòng máu trong người mình là sự tiếp nối của thế hệ cha anh - những tiền nhân đã gác lại những nỗi niềm hạnh phúc riêng tư, những trang sách, những giảng đường, hay những mâm cơm gia đình bé nhỏ, để dùng máu đào của mình nhuộm lên lá cờ tổ quốc thêm đỏ chói, để thế hệ mai sau thêm bình an, ấm yên.\nKính cẩn nghiêng mình trước hồn thiêng dân tộc đã chở che cho quốc thái dân an. Mong nguyện một cuộc sống ổn định, bình an tới các gia đình liệt sĩ, những thương bệnh binh. \n\nKính chúc các mẹ Việt Nam anh hùng mến thương luôn mạnh khỏe. \n\nChúng con trân trọng và biết ơn giá trị hòa bình ngày hôm nay và mãi về sau. Luôn hướng về tổ quốc.\n\nChưa bao giờ ngừng tự hào về Ông và những anh hùng liệt sĩ.\nCon thương Ông nội thật nhiều.\nNgày 27/7/2023.',
        image: [
          'assets/images/post/10.jpg',
          'assets/images/post/11.jpg',
        ],
        like: 15000,
        love: 7300,
        comment: 258,
        haha: 235,
        share: 825,
        lovelove: 212,
        wow: 9,
        layout: 'classic',
        type: 'memory',
      ),
      Post(
        user: user,
        time: '${today.day} thg ${today.month}, ${today.year - 4}',
        shareWith: 'public',
        content:
            'Những câu thả thính Tiếng Anh mượt mà - The smoothest pick up lines \n\n1. You wanna know who my crush is? - Cậu muốn biết crush của tớ là ai hơm?\nSimple. Just read the first word :> - Đơn giản. Cứ đọc lại từ đầu tiên\n\n2. Hey, i think my phone is broken - Tớ nghĩ điện thoại tớ bị hỏng rùi \nIt doesn’t have your phone number in it. - Vì nó không có sđt của cậu trong nàyyy \nCan you fix it? 😉 - Cậu sửa được không ha?\n\n3. According to my calculations, the more you smile, the more i fall - Theo tính toán của tớ, cậu càng cười, tớ càng đổ \n\n4. I can’t turn water into wine - Tớ không thể biến nước thành rịu\nBut i can turn you into mine - Nhưng tớ có thể biến cậu thành “của tớ” \n\n5. Can i take a picture of you? - Cho tớ chụp 1 bức hình với cậu được hem\nAh, to tell Santa what i want for Christmas this year - À để nói với ông già Noel tớ muốn quà gì dịp giáng sinh năm nay \n\nÁp dụng cho bạn thân, crush, ngừi iu hay cho zui cũng được lun 🥰',
        image: [
          'assets/images/post/3.jpg',
          'assets/images/post/4.jpg',
          'assets/images/post/5.jpg'
        ],
        like: 15000,
        love: 7300,
        comment: 258,
        haha: 235,
        share: 825,
        lovelove: 212,
        wow: 9,
        layout: 'classic',
        type: 'memory',
      ),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          titleSpacing: 0,
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
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.5),
              child: Container(
                color: Colors.black12,
                height: 0.5,
              )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Kỷ niệm',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              IconButton(
                onPressed: () {},
                splashRadius: 20,
                icon: const Icon(
                  Icons.settings_rounded,
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
            Container(
              color: Colors.white,
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/memory_header.png',
                    fit: BoxFit.cover,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Text(
                      'Chúng tôi hy vọng bạn thích ôn lại và chia sẻ kỷ niệm trên Facebook, từ các kỷ niệm gần đây nhất đến những kỷ niệm ngày xa xưa.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black26,
              width: double.infinity,
              height: 8,
            ),
            for (int i = 0; i < posts.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'VÀO NGÀY NÀY',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          '${i + 1} năm trước',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: Colors.black12,
                    margin: const EdgeInsets.only(
                      bottom: 10,
                      left: 10,
                      right: 10,
                    ),
                  ),
                  PostCard(post: posts[i]),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/message.png',
                                color: Colors.black,
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Gửi',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
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
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/share-fill.png',
                                color: Colors.black,
                                width: 22,
                                height: 22,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Chia sẻ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: Colors.black26,
                    width: double.infinity,
                    height: 8,
                  ),
                ],
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 10,
                  ),
                  child: Icon(
                    Icons.add_circle,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 10,
                  ),
                  child: Text(
                    'Bố cục kỷ niệm',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset('assets/images/mem1.jpg')),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset('assets/images/mem2.jpg')),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset('assets/images/mem3.jpg')),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset('assets/images/mem4.jpg')),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.black26,
              width: double.infinity,
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
                top: 10,
              ),
              child: ImageIcon(
                AssetImage('assets/images/edit.png'),
                size: 35,
                color: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
                top: 10,
              ),
              child: Text(
                'Tạo bài viết mới',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black26,
              width: double.infinity,
              height: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(user.avatar),
                    radius: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Bạn đang nghĩ gì thế?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black26,
              width: double.infinity,
              height: 0.5,
            ),
            const SizedBox(
              height: 5,
            ),
            const IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Check in',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.black26,
                    width: 1,
                    thickness: 0.5,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.image,
                          color: Colors.green,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Ảnh',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.black26,
              width: double.infinity,
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
