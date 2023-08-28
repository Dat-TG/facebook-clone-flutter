import 'package:facebook/features/news-feed/widgets/add_story_card.dart';
import 'package:facebook/features/news-feed/widgets/post_card.dart';
import 'package:facebook/features/news-feed/widgets/story_card.dart';
import 'package:facebook/models/post.dart';
import 'package:facebook/models/story.dart';
import 'package:facebook/models/user.dart';
import 'package:facebook/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsFeedScreen extends StatefulWidget {
  final GlobalKey scrollKey;
  const NewsFeedScreen({super.key, required this.scrollKey});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  Color colorNewPost = Colors.transparent;
  final stories = [
    Story(
        user: User(
            name: 'Doraemon',
            avatar:
                'https://scontent.fsgn5-13.fna.fbcdn.net/v/t39.30808-6/301631605_1486149091846101_3599197236844582199_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=qyUE7pWwC-QAX_V9GYu&_nc_ht=scontent.fsgn5-13.fna&oh=00_AfDE3wz60kT6q2fIAxQl-aqxI6T0bhYwrwELc3FLE5l80w&oe=64EEEDDA'),
        image:
            'https://scontent.fsgn5-5.fna.fbcdn.net/v/t39.30808-6/370430048_695911159244873_9010100756033061576_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=vBz7CCW4_NYAX8Chsec&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfAp1exKMDmLV-i-IRJnD3zNcCa1zNz9Wx5fWLZgFD5h9Q&oe=64EF571F',
        time: DateTime(2023, 8, 24, 16, 5)),
    Story(
        user: User(
            name: 'Sách Cũ Ngọc',
            avatar:
                'https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/120188661_673069906671212_8246754682764353003_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=fdqeI9Wn0AMAX9nzzCG&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfB5EKirqDyvu0EAo6R6mi6MJEhYxzydUh1AmfiMWCtMjQ&oe=65118599'),
        image:
            'https://scontent.fsgn5-2.fna.fbcdn.net/v/t39.30808-6/370770078_1309473256364204_128656410125479932_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=qJX9DUE9EN0AX_92HRy&_nc_ht=scontent.fsgn5-2.fna&oh=00_AfDm6aqS6yYe4YWXEOY8G7-dGCMmw-ExCaxc4M0pf5UdDw&oe=64EEA479',
        time: DateTime(2023, 8, 24, 16, 5)),
    Story(
        user: User(
            name: 'Vietnamese Argentina Football Fan Club (VAFFC)',
            avatar:
                'https://scontent.fsgn5-6.fna.fbcdn.net/v/t39.30808-6/319883972_1003383920619585_4679985923661930489_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Yi3zkdNw9lQAX8ccSvt&_nc_ht=scontent.fsgn5-6.fna&oh=00_AfBrXGhu5YOD1vfLE4LiOLw73XDr1482W720YaEBra2ffg&oe=64EE6F0A'),
        image:
            'https://scontent.fsgn5-5.fna.fbcdn.net/v/t39.30808-6/360166979_745368937598708_502110138069318059_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=0debeb&_nc_ohc=6lDZARIjui0AX_JeQbA&_nc_ht=scontent.fsgn5-5.fna&oh=00_AfB71mNx5bfLCnqMmSMDk8oKfB8DP-FdGNzS1LdebmNTPQ&oe=64EFE14C',
        time: DateTime(2023, 8, 24, 16, 5)),
  ];

  final posts = [
    Post(
      user: User(
          name: 'Đài Phát Thanh.',
          avatar:
              'https://scontent.fsgn5-15.fna.fbcdn.net/v/t39.30808-6/339122927_1347965006053141_1323654940389313527_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=oqRr-PRhelAAX-zrYBv&_nc_ht=scontent.fsgn5-15.fna&oh=00_AfA06jJSw3vkIVNHCAcF4D2Eu_KCCVRph8XWhRHaAr4DTQ&oe=64EF8893'),
      time: '16 giờ',
      shareWith: 'public',
      content:
          'Rap Việt Mùa 3 (2023) đã tìm ra Top 9 bước vào Chung Kết, hứa hẹn một trận đại chiến cực căng.\n\nTập cuối vòng Bứt Phá Rap Việt Mùa 3 (2023) đã chính thức khép lại và chương trình đã tìm ra 9 gương mặt đầy triển vọng để bước vào vòng Chung Kết tranh ngôi vị quán quân.\n\nKịch tính, cam go và đầy bất ngờ đến tận những giây phút cuối, Huỳnh Công Hiếu của team B Ray đã vượt lên trên 3 đối thủ Yuno BigBoi, Richie D. ICY, gung0cay để giành được tấm vé đầu tiên bước vào Chung Kết cho đội của mình.\n\nỞ bảng F, không hề thua kém người đồng đội cùng team, 24k.Right cũng có được vé vào Chung Kết sau khi hạ gục SMO team Andree Right Hand, Pháp Kiều – team BigDaddy và Tọi đến từ team Thái VG tại bảng F.\n\nKết thúc toàn bộ phần trình diễn của các thí sinh ở vòng Bứt Phá cũng là lúc 3 Giám khảo hội ý để đưa ra quyết định chọn người nhận Nón Vàng của mình để bước tiếp vào đêm Chung Kết Rap Việt Mùa 3 (2023).\n\nNữ giám khảo Suboi quyết định trao nón vàng cho thành viên đội HLV BigDaddy - Pháp Kiều. Tiếp theo, SMO là người được Giám khảo Karik tin tưởng trao nón. Cuối cùng, Giám khảo JustaTee quyết định trao gửi Nón Vàng của mình cho Double2T.\n\nNhư vậy, đội hình Top 9 bước vào Chung kết đã hoàn thiện gồm: Huỳnh Công Hiếu, 24k.Right – Team B Ray; Liu Grace, Mikelodic – Team Thái VG; SMO, Rhyder – Team Andree Right Hand và Pháp Kiều, Double2T, Tez – Team BigDaddy.',
      image: [
        'https://scontent.fsgn5-15.fna.fbcdn.net/v/t39.30808-6/370864319_864199815072408_2393037458283783211_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=730e14&_nc_ohc=jvUU9TPbWsYAX_EX9qw&_nc_ht=scontent.fsgn5-15.fna&oh=00_AfCRdrXoYoN9jsFFyESGyAXCAb-xsdmOw-PzLFlABhJWJQ&oe=64EF09F4'
      ],
      like: 8500,
      angry: 0,
      comment: 902,
      haha: 43,
      love: 2200,
      lovelove: 59,
      sad: 36,
      share: 98,
      wow: 7,
    ),
    Post(
      user: User(
          name: 'GOAL Vietnam',
          verified: true,
          avatar:
              'https://scontent.fsgn5-15.fna.fbcdn.net/v/t39.30808-6/253661980_4334874469968763_6861397363581584707_n.png?_nc_cat=1&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=TzPm9OfFjtQAX8APnh3&_nc_ht=scontent.fsgn5-15.fna&oh=00_AfBz_23yyMXZH9HedBgjGeWeP047SIs91TnuYWVchR5ORA&oe=64F17AED'),
      time: '3 phút',
      shareWith: 'public',
      content:
          '✅ 10 năm cống hiến cho bóng đá trẻ Việt Nam\n✅ Người đầu tiên đưa Việt Nam tham dự World Cup ở cấp độ U20 🌏🇻🇳\n✅ Giành danh hiệu đầu tiên cùng U23 Việt Nam tại giải U23 Đông Nam Á 2023 🏆\n\nMột người thầy đúng nghĩa với sự tận tụy cống hiến cho sự nghiệp ươm mầm những tương lai của bóng đá nước nhà. Cảm ơn ông, HLV Hoàng Anh Tuấn ❤️\n\n📸 VFF\n\n#goalvietnam #hot #HoangAnhTuan #U23Vietnam',
      image: [
        'https://scontent.fsgn5-13.fna.fbcdn.net/v/t39.30808-6/371312787_606453368359308_4124093680916535505_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=KRrjglV0siIAX-6jFPK&_nc_ht=scontent.fsgn5-13.fna&oh=00_AfAilzZgZ-3x5MXDI48fhWe7Vzt47v-TumUojzHudyRFMg&oe=64F1B417'
      ],
      like: 163,
      love: 24,
      comment: 5,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).user;
    return SingleChildScrollView(
      key: widget.scrollKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                    radius: 20,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      setState(() {
                        colorNewPost = Colors.transparent;
                      });
                    },
                    onTapUp: (tapUpDetails) {
                      setState(() {
                        colorNewPost = Colors.black12;
                      });
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.black12,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: colorNewPost,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text('Bạn đang nghĩ gì?'),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  splashRadius: 20,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.image,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 5,
            color: Colors.black26,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: AddStoryCard(),
                ),
                ...stories
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: StoryCard(story: e),
                        ))
                    .toList()
              ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 5,
            color: Colors.black26,
          ),
          Column(
            children: posts
                .map((e) => Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        PostCard(post: e),
                        Container(
                          width: double.infinity,
                          height: 5,
                          color: Colors.black26,
                        ),
                      ],
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
