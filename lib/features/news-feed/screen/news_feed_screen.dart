import 'package:facebook/features/news-feed/widgets/story_card.dart';
import 'package:facebook/models/story.dart';
import 'package:facebook/models/user.dart';
import 'package:flutter/material.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  Color colorNewPost = Colors.transparent;
  final User user = User(
      name: 'Lê Công Đắt',
      avatar:
          'https://scontent.fsgn5-10.fna.fbcdn.net/v/t39.30808-6/318493519_1198259884399429_381099977086172582_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=n5Big1aY7EwAX8Op479&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfCFHCJsdxPVikMDMhEYM8yoUq2cgH5rUwzfSCZG-ao2Bw&oe=64EE43CB');
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        color: colorNewPost,
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Colors.black12,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(20),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: stories
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: StoryCard(story: e),
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
