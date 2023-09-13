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
  static double offset = 0;
  final ScrollController parentScrollController;
  const NewsFeedScreen({super.key, required this.parentScrollController});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  Color colorNewPost = Colors.transparent;
  final stories = [
    Story(
      user: User(
        name: 'Doraemon',
        avatar: 'assets/images/user/doraemon.jpg',
        type: 'page',
      ),
      image: ['assets/images/story/1.jpg'],
      time: ['12 phút'],
      shareWith: 'public',
    ),
    Story(
      user: User(
          name: 'Sách Cũ Ngọc', avatar: 'assets/images/user/sachcungoc.jpg'),
      image: ['assets/images/story/2.jpg'],
      time: ['3 giờ'],
      shareWith: 'friends',
    ),
    Story(
      user: User(
        name: 'Vietnamese Argentina Football Fan Club (VAFFC)',
        avatar: 'assets/images/user/vaffc.jpg',
        type: 'page',
      ),
      image: ['assets/images/story/3.jpg'],
      time: ['5 giờ'],
      shareWith: 'friends-of-friends',
    ),
    Story(
      user:
          User(name: 'Minh Hương', avatar: 'assets/images/user/minhhuong.jpg'),
      image: [
        'assets/images/story/4.jpg',
        'assets/images/story/5.jpg',
        'assets/images/story/6.jpg',
        'assets/images/story/7.jpg',
      ],
      video: ['assets/videos/2.mp4', 'assets/videos/1.mp4'],
      time: ['1 phút'],
      shareWith: 'friends',
    ),
    Story(
      user: User(name: 'Khánh Vy', avatar: 'assets/images/user/khanhvy.jpg'),
      video: ['assets/videos/3.mp4'],
      time: ['1 phút'],
      shareWith: 'friends',
    ),
  ];

  final posts = [
    Post(
      user: User(
        name: 'Đài Phát Thanh.',
        avatar: 'assets/images/user/daiphatthanh.jpg',
        type: 'page',
      ),
      time: '16 giờ',
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
    ),
    Post(
      user: User(
        verified: true,
        name: 'GOAL Vietnam',
        avatar: 'assets/images/user/goal.png',
        cover: 'assets/images/user/goal-cover.png',
        type: 'page',
        likes: 285308,
        followers: 379103,
        bio:
            'GOAL là trang tin điện tử về bóng đá lớn nhất thế giới, cập nhật liên tục, đa chiều về mọi giải đấu',
        pageType: 'Công ty truyền thông/tin tức',
        socialMedias: [
          SocialMedia(
            icon: 'assets/images/email.png',
            name: 'vietnamdesk@goal.com',
            link: 'mailto:vietnamdesk@goal.com',
          ),
          SocialMedia(
            icon: 'assets/images/link.png',
            name: 'goal.com/vn',
            link: 'goal.com/vn',
          ),
        ],
        posts: [
          Post(
            user: User(
              verified: true,
              name: 'GOAL Vietnam',
              avatar: 'assets/images/user/goal.png',
            ),
            time: '3 phút',
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
            user: User(
              verified: true,
              name: 'GOAL Vietnam',
              avatar: 'assets/images/user/goal.png',
            ),
            time: '3 phút',
            shareWith: 'public',
            content: 'Do you like Phở?\nBecause I can be your Pho-ever ✨✨',
            image: [
              'assets/images/post/3.jpg',
              'assets/images/post/5.jpg',
              'assets/images/post/12.jpg',
              'assets/images/post/13.jpg',
              'assets/images/post/14.jpg',
              'assets/images/post/15.jpg',
              'assets/images/post/16.jpg',
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
            user: User(
              verified: true,
              name: 'GOAL Vietnam',
              avatar: 'assets/images/user/goal.png',
            ),
            time: '3 phút',
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
            layout: 'column',
            type: 'memory',
          ),
        ],
      ),
      time: '3 phút',
      shareWith: 'public',
      content:
          '✅ 10 năm cống hiến cho bóng đá trẻ Việt Nam\n✅ Người đầu tiên đưa Việt Nam tham dự World Cup ở cấp độ U20 🌏🇻🇳\n✅ Giành danh hiệu đầu tiên cùng U23 Việt Nam tại giải U23 Đông Nam Á 2023 🏆\n\nMột người thầy đúng nghĩa với sự tận tụy cống hiến cho sự nghiệp ươm mầm những tương lai của bóng đá nước nhà. Cảm ơn ông, HLV Hoàng Anh Tuấn ❤️\n\n📸 VFF\n\n#goalvietnam #hot #HoangAnhTuan #U23Vietnam',
      image: ['assets/images/post/2.jpg'],
      like: 163,
      love: 24,
      comment: 5,
    ),
    Post(
      user: User(
        name: 'Khánh Vy',
        verified: true,
        cover: 'assets/images/user/khanhvy-cover.jpg',
        avatar: 'assets/images/user/khanhvy.jpg',
        bio: 'Trần Khánh Vy (1999) - MC VTV - Youtuber - Tác giả Sách',
        socialMedias: [
          SocialMedia(
            icon: 'assets/images/instagram.png',
            name: 'khanhvyccf',
            link: 'instagram.com/khanhvyccf',
          ),
        ],
        topFriends: [
          User(
            name: 'Khánh Vy',
            avatar: 'assets/images/user/khanhvy.jpg',
          ),
          User(
            name: 'Leo Messi',
            avatar: 'assets/images/user/messi.jpg',
          ),
          User(
            name: 'Minh Hương',
            avatar: 'assets/images/user/minhhuong.jpg',
          ),
          User(
            name: 'Bảo Ngân',
            avatar: 'assets/images/user/baongan.jpg',
          ),
          User(
            name: 'Hà Linhh',
            avatar: 'assets/images/user/halinh.jpg',
          ),
          User(
            name: 'Minh Trí',
            avatar: 'assets/images/user/minhtri.jpg',
          ),
        ],
      ),
      time: '3 phút',
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
    ),
    Post(
      user: User(
          name: 'Khánh Vy',
          verified: true,
          avatar: 'assets/images/user/khanhvy.jpg'),
      time: '3 phút',
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
    ),
    Post(
      user: User(
        name: 'Minh Hương',
        avatar: 'assets/images/user/minhhuong.jpg',
        cover: 'assets/images/story/6.jpg',
        hometown: 'Vietri, Phú Thọ, Vietnam',
        educations: [
          Education(
              majors: 'Thiết Kế Đồ Họa - Graphics Design',
              school: 'Mỹ Thuật Công Nghiệp'),
          Education(majors: '', school: 'Đoàn Trường THPT Việt Trì'),
        ],
        address: 'Hà nội',
        stories: [
          Story(
            user: User(
              name: 'Minh Hương',
              avatar: 'assets/images/user/minhhuong.jpg',
            ),
            image: ['assets/images/story/3.jpg'],
            time: ['5 giờ'],
            shareWith: 'friends-of-friends',
            name: '😧',
          ),
          Story(
            user: User(
              name: 'Minh Hương',
              avatar: 'assets/images/user/minhhuong.jpg',
            ),
            image: [
              'assets/images/story/4.jpg',
              'assets/images/story/5.jpg',
              'assets/images/story/6.jpg',
              'assets/images/story/7.jpg',
            ],
            video: ['assets/videos/2.mp4', 'assets/videos/1.mp4'],
            time: ['1 phút'],
            shareWith: 'friends',
            name: '18+',
          ),
          Story(
            user: User(
              name: 'Minh Hương',
              avatar: 'assets/images/user/minhhuong.jpg',
            ),
            video: ['assets/videos/3.mp4'],
            time: ['1 phút'],
            shareWith: 'friends',
            name: '🎨',
          ),
        ],
        socialMedias: [
          SocialMedia(
            icon: 'assets/images/instagram.png',
            name: 'minh.huong.le',
            link: 'instagram.com/minh.huong.le',
          ),
          SocialMedia(
            icon: 'assets/images/tiktok.png',
            name: 'minh.huong.le',
            link: 'tiktok.com/minh.huong.le',
          ),
        ],
        topFriends: [
          User(
            name: 'Khánh Vy',
            avatar: 'assets/images/user/khanhvy.jpg',
          ),
          User(
            name: 'Leo Messi',
            avatar: 'assets/images/user/messi.jpg',
          ),
          User(
            name: 'Minh Hương',
            avatar: 'assets/images/user/minhhuong.jpg',
          ),
          User(
            name: 'Bảo Ngân',
            avatar: 'assets/images/user/baongan.jpg',
          ),
          User(
            name: 'Hà Linhh',
            avatar: 'assets/images/user/halinh.jpg',
          ),
          User(
            name: 'Minh Trí',
            avatar: 'assets/images/user/minhtri.jpg',
          ),
        ],
      ),
      time: '3 phút',
      shareWith: 'public',
      content: 'My chiuuu 😚',
      image: [
        'assets/images/post/6.jpg',
        'assets/images/post/7.jpg',
        'assets/images/post/8.jpg',
        'assets/images/post/9.jpg',
      ],
      like: 438,
      love: 285,
      comment: 258,
      haha: 3,
      share: 825,
      lovelove: 14,
      sad: 1,
      wow: 2,
      layout: 'classic',
    ),
    Post(
      user: User(
          name: 'Khánh Vy',
          verified: true,
          avatar: 'assets/images/user/khanhvy.jpg'),
      time: '3 phút',
      shareWith: 'public',
      content: 'Do you like Phở?\nBecause I can be your Pho-ever ✨✨',
      image: [
        'assets/images/post/12.jpg',
        'assets/images/post/13.jpg',
        'assets/images/post/14.jpg',
        'assets/images/post/15.jpg',
        'assets/images/post/16.jpg'
      ],
      like: 15000,
      love: 7300,
      comment: 258,
      haha: 235,
      share: 825,
      lovelove: 212,
      wow: 9,
      layout: 'classic',
    ),
    Post(
      user: User(
          name: 'Khánh Vy',
          verified: true,
          avatar: 'assets/images/user/khanhvy.jpg'),
      time: '3 phút',
      shareWith: 'public',
      content: 'Do you like Phở?\nBecause I can be your Pho-ever ✨✨',
      image: [
        'assets/images/post/3.jpg',
        'assets/images/post/5.jpg',
        'assets/images/post/12.jpg',
        'assets/images/post/13.jpg',
        'assets/images/post/14.jpg',
        'assets/images/post/15.jpg',
        'assets/images/post/16.jpg',
      ],
      like: 15000,
      love: 7300,
      comment: 258,
      haha: 235,
      share: 825,
      lovelove: 212,
      wow: 9,
      layout: 'classic',
    ),
    Post(
      user:
          User(name: 'Minh Hương', avatar: 'assets/images/user/minhhuong.jpg'),
      time: '3 phút',
      shareWith: 'public',
      content: 'My chiuuu 😚',
      image: [
        'assets/images/post/6.jpg',
        'assets/images/post/7.jpg',
        'assets/images/post/8.jpg',
        'assets/images/post/9.jpg',
      ],
      like: 438,
      love: 285,
      comment: 258,
      haha: 3,
      share: 825,
      lovelove: 14,
      sad: 1,
      wow: 2,
      layout: 'column',
    ),
    Post(
      user: User(
          name: 'Khánh Vy',
          verified: true,
          avatar: 'assets/images/user/khanhvy.jpg'),
      time: '3 phút',
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
      layout: 'column',
    ),
    Post(
      user: User(
          name: 'Khánh Vy',
          verified: true,
          avatar: 'assets/images/user/khanhvy.jpg'),
      time: '3 phút',
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
      layout: 'column',
    ),
    Post(
      user: User(
          name: 'Khánh Vy',
          verified: true,
          avatar: 'assets/images/user/khanhvy.jpg'),
      time: '3 phút',
      shareWith: 'public',
      content: 'Do you like Phở?\nBecause I can be your Pho-ever ✨✨',
      image: [
        'assets/images/post/3.jpg',
        'assets/images/post/5.jpg',
        'assets/images/post/12.jpg',
        'assets/images/post/13.jpg',
        'assets/images/post/14.jpg',
        'assets/images/post/15.jpg',
        'assets/images/post/16.jpg',
      ],
      like: 15000,
      love: 7300,
      comment: 258,
      haha: 235,
      share: 825,
      lovelove: 212,
      wow: 9,
      layout: 'column',
    ),
    Post(
      user: User(
          name: 'Khánh Vy',
          verified: true,
          avatar: 'assets/images/user/khanhvy.jpg'),
      time: '3 phút',
      shareWith: 'public',
      content: 'Do you like Phở?\nBecause I can be your Pho-ever ✨✨',
      image: [
        'assets/images/post/3.jpg',
        'assets/images/post/5.jpg',
        'assets/images/post/12.jpg',
        'assets/images/post/13.jpg',
        'assets/images/post/14.jpg',
        'assets/images/post/15.jpg',
        'assets/images/post/16.jpg',
      ],
      like: 15000,
      love: 7300,
      comment: 258,
      haha: 235,
      share: 825,
      lovelove: 212,
      wow: 9,
      layout: 'quote',
    ),
    Post(
      user:
          User(name: 'Minh Hương', avatar: 'assets/images/user/minhhuong.jpg'),
      time: '3 phút',
      shareWith: 'public',
      content: 'My chiuuu 😚',
      image: [
        'assets/images/post/6.jpg',
        'assets/images/post/7.jpg',
        'assets/images/post/8.jpg',
        'assets/images/post/9.jpg',
      ],
      like: 438,
      love: 285,
      comment: 258,
      haha: 3,
      share: 825,
      lovelove: 14,
      sad: 1,
      wow: 2,
      layout: 'quote',
    ),
    Post(
      user: User(
          name: 'Khánh Vy',
          verified: true,
          avatar: 'assets/images/user/khanhvy.jpg'),
      time: '3 phút',
      shareWith: 'public',
      content: 'Do you like Phở?\nBecause I can be your Pho-ever ✨✨',
      image: [
        'assets/images/post/3.jpg',
        'assets/images/post/5.jpg',
        'assets/images/post/12.jpg',
      ],
      like: 15000,
      love: 7300,
      comment: 258,
      haha: 235,
      share: 825,
      lovelove: 212,
      wow: 9,
      layout: 'quote',
    ),
    Post(
      user: User(
          name: 'Khánh Vy',
          verified: true,
          avatar: 'assets/images/user/khanhvy.jpg'),
      time: '3 phút',
      shareWith: 'public',
      content: 'Do you like Phở?\nBecause I can be your Pho-ever ✨✨',
      image: [
        'assets/images/post/3.jpg',
        'assets/images/post/5.jpg',
      ],
      like: 15000,
      love: 7300,
      comment: 258,
      haha: 235,
      share: 825,
      lovelove: 212,
      wow: 9,
      layout: 'quote',
    ),
    Post(
      user: User(
          name: 'Khánh Vy',
          verified: true,
          avatar: 'assets/images/user/khanhvy.jpg'),
      time: '3 phút',
      shareWith: 'public',
      content: 'Do you like Phở?\nBecause I can be your Pho-ever ✨✨',
      image: [
        'assets/images/post/3.jpg',
        'assets/images/post/5.jpg',
        'assets/images/post/12.jpg',
      ],
      like: 15000,
      love: 7300,
      comment: 258,
      haha: 235,
      share: 825,
      lovelove: 212,
      wow: 9,
      layout: 'frame',
    ),
    Post(
      user:
          User(name: 'Minh Hương', avatar: 'assets/images/user/minhhuong.jpg'),
      time: '3 phút',
      shareWith: 'public',
      content: 'My chiuuu 😚',
      image: [
        'assets/images/post/6.jpg',
        'assets/images/post/7.jpg',
        'assets/images/post/8.jpg',
        'assets/images/post/9.jpg',
      ],
      like: 438,
      love: 285,
      comment: 258,
      haha: 3,
      share: 825,
      lovelove: 14,
      sad: 1,
      wow: 2,
      layout: 'frame',
    ),
  ];

  ScrollController scrollController =
      ScrollController(initialScrollOffset: NewsFeedScreen.offset);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).user;
    scrollController.addListener(() {
      if (widget.parentScrollController.hasClients) {
        widget.parentScrollController.jumpTo(
            widget.parentScrollController.offset +
                scrollController.offset -
                NewsFeedScreen.offset);
        NewsFeedScreen.offset = scrollController.offset;
      }
    });
    return SingleChildScrollView(
      controller: scrollController,
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
                    backgroundImage: AssetImage(user.avatar),
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
          ),
        ],
      ),
    );
  }
}
