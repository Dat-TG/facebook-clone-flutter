import 'package:facebook/features/comment/widgets/single_comment.dart';
import 'package:facebook/models/comment.dart';
import 'package:facebook/models/user.dart';
import 'package:flutter/material.dart';
import 'package:facebook/models/post.dart';

class CommentScreen extends StatefulWidget {
  static const String routeName = '/comment-screen';
  final Post post;
  const CommentScreen({super.key, required this.post});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

enum SortingOption { fit, newest, all }

class _CommentScreenState extends State<CommentScreen> {
  List<String> icons = [];
  String reactions = '0';
  bool isInWidgetTree = true;
  SortingOption _sortingOption = SortingOption.fit;

  final List<Comment> comments = [
    Comment(
      user: User(
          name: 'Khánh Vy',
          avatar: 'assets/images/user/khanhvy.jpg',
          verified: true),
      content: 'Kỉ niệm được makeup ở Hàn của tuiii',
      time: '1 tuần',
      like: 37,
      love: 37,
      lovelove: 3,
      haha: 2,
      wow: 1,
      replies: [
        Comment(
          user: User(
              name: 'Vương Hồng Thúy',
              avatar: 'assets/images/user/vuonghongthuy.jpg'),
          content: 'ủa mà chị cao mét bn vậy ạ',
          time: '1 tuần',
          replies: [],
        ),
        Comment(
          user: User(
              name: 'Đài Phát Thanh',
              avatar: 'assets/images/user/daiphatthanh.jpg'),
          content: 'xinh đẹp tuyệt vời 🙆‍♀️',
          time: '1 tuần',
          replies: [],
        ),
      ],
    ),
    Comment(
      user: User(
          name: 'Minh Hương',
          avatar: 'assets/images/user/minhhuong.jpg',
          verified: true),
      content: 'Sai từ phone kìa chị ơiiii😭😭😭',
      time: '1 tuần',
      replies: [
        Comment(
          user: User(
              name: 'Khánh Vy',
              avatar: 'assets/images/user/khanhvy.jpg',
              verified: true),
          content: 'ui chùi gõ lộn tui gõ lại rùii hihi',
          time: '1 tuần',
          love: 2,
          lovelove: 2,
          replies: [],
        ),
      ],
    ),
    Comment(
      user: User(name: 'Hà Linhh', avatar: 'assets/images/user/halinh.jpg'),
      content: '',
      time: '1 tuần',
      image: 'assets/images/two-bears-love.png',
      replies: [],
    ),
    Comment(
      user: User(
          name: 'Nguyễn Thị Minh Tuyền',
          avatar: 'assets/images/user/minhtuyen.jpg'),
      content:
          'Chị Vy nhìn đáng yêu quá chừng luôn đó😘😘😘Chúc chị Vy có một ngày mới thật tốt lành và nhiều năng lượng nha❤️❤️❤️Thích chịiii😘😘😘',
      time: '1 tuần',
      image: 'assets/images/post/13.jpg',
      replies: [],
    ),
  ];

  @override
  void initState() {
    List<int> list = [
      widget.post.like != null ? widget.post.like! : 0,
      widget.post.haha != null ? widget.post.haha! : 0,
      widget.post.love != null ? widget.post.love! : 0,
      widget.post.lovelove != null ? widget.post.lovelove! : 0,
      widget.post.wow != null ? widget.post.wow! : 0,
      widget.post.sad != null ? widget.post.sad! : 0,
      widget.post.angry != null ? widget.post.angry! : 0
    ];
    list.sort((a, b) => b - a);
    int sum = 0;
    for (int i = 0; i < list.length; i++) {
      sum += list[i];
    }
    setState(() {
      reactions = '';
      String tmp = sum.toString();
      int x = 0;
      for (int i = tmp.length - 1; i > 0; i--) {
        x++;
        reactions = '${tmp[i]}$reactions';
        if (x == 3) reactions = '.$reactions';
      }
      reactions = '${tmp[0]}$reactions';
      icons = [];
      if (list[0] == widget.post.like) {
        icons.add('assets/images/reactions/like.png');
      } else if (list[0] == widget.post.haha) {
        icons.add('assets/images/reactions/haha.png');
      } else if (list[0] == widget.post.love) {
        icons.add('assets/images/reactions/love.png');
      } else if (list[0] == widget.post.lovelove) {
        icons.add('assets/images/reactions/care.png');
      } else if (list[0] == widget.post.wow) {
        icons.add('assets/images/reactions/wow.png');
      } else if (list[0] == widget.post.sad) {
        icons.add('assets/images/reactions/sad.png');
      } else if (list[0] == widget.post.angry) {
        icons.add('assets/images/reactions/angry.png');
      }

      if (list[1] == widget.post.like) {
        icons.add('assets/images/reactions/like.png');
      } else if (list[1] == widget.post.haha) {
        icons.add('assets/images/reactions/haha.png');
      } else if (list[1] == widget.post.love) {
        icons.add('assets/images/reactions/love.png');
      } else if (list[1] == widget.post.lovelove) {
        icons.add('assets/images/reactions/care.png');
      } else if (list[1] == widget.post.wow) {
        icons.add('assets/images/reactions/wow.png');
      } else if (list[1] == widget.post.sad) {
        icons.add('assets/images/reactions/sad.png');
      } else if (list[1] == widget.post.angry) {
        icons.add('assets/images/reactions/angry.png');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isInWidgetTree
        ? Dismissible(
            direction: DismissDirection.down,
            onDismissed: (direction) {
              setState(() {
                isInWidgetTree = false;
              });
              Navigator.pop(context);
            },
            key: const Key('comment-screen'),
            child: SafeArea(
              child: Material(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Stack(
                    children: [
                      BackdropFilter(
                        filter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.darken),
                        child: Container(
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                bottom: 15,
                                top: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 42,
                                        child: Stack(
                                          children: [
                                            const SizedBox(
                                              width: 24,
                                              height: 24,
                                            ),
                                            Positioned(
                                              top: 2,
                                              left: 18,
                                              child: Image.asset(
                                                icons[1],
                                                width: 20,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 2,
                                                    )),
                                                child: Image.asset(
                                                  icons[0],
                                                  width: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        reactions,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.navigate_next_rounded,
                                        size: 30,
                                        color: Colors.black54,
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    child: Image.asset(
                                      'assets/images/like.png',
                                      width: 22,
                                      height: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  60 -
                                  MediaQuery.of(context).padding.vertical,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Material(
                                      color: Colors.transparent,
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
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: Container(
                                                          height: 4,
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.grey,
                                                            shape: BoxShape
                                                                .rectangle,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: ListTile(
                                                        onTap: () {
                                                          setState(() {
                                                            _sortingOption =
                                                                SortingOption
                                                                    .fit;
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        title: const Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Phù hợp nhất',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              'Hiển thị bình luận của bạn bè và những bình luận có nhiều tương tác nhất trước tiên.',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black54,
                                                                height: 1.4,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        leading: Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors
                                                                .grey[300],
                                                          ),
                                                          child:
                                                              Transform.scale(
                                                            scale: 1.1,
                                                            child: Radio<
                                                                SortingOption>(
                                                              activeColor:
                                                                  Colors.black,
                                                              value:
                                                                  SortingOption
                                                                      .fit,
                                                              groupValue:
                                                                  _sortingOption,
                                                              onChanged:
                                                                  (SortingOption?
                                                                      value) {
                                                                setState(
                                                                  () {
                                                                    _sortingOption =
                                                                        value ??
                                                                            SortingOption.fit;
                                                                  },
                                                                );
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: ListTile(
                                                        onTap: () {
                                                          setState(() {
                                                            _sortingOption =
                                                                SortingOption
                                                                    .newest;
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        title: const Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Mới nhất',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              'Hiển thị các bình luận mới nhất trước tiên. Một số bình luận đã được lọc ra.',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black54,
                                                                height: 1.4,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        leading: Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors
                                                                .grey[300],
                                                          ),
                                                          child:
                                                              Transform.scale(
                                                            scale: 1.1,
                                                            child: Radio<
                                                                SortingOption>(
                                                              activeColor:
                                                                  Colors.black,
                                                              value:
                                                                  SortingOption
                                                                      .newest,
                                                              groupValue:
                                                                  _sortingOption,
                                                              onChanged:
                                                                  (SortingOption?
                                                                      value) {
                                                                setState(() {
                                                                  _sortingOption =
                                                                      value ??
                                                                          SortingOption
                                                                              .newest;
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Material(
                                                      color: Colors.transparent,
                                                      child: ListTile(
                                                        onTap: () {
                                                          setState(() {
                                                            _sortingOption =
                                                                SortingOption
                                                                    .all;
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        title: const Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Tất cả bình luận',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              'Hiển thị tất cả bình luận, bao gồm cả nội dung có thể là spam. Những bình luận phù hợp nhất sẽ hiển thị đầu tiên.',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black54,
                                                                height: 1.4,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        leading: Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors
                                                                .grey[300],
                                                          ),
                                                          child:
                                                              Transform.scale(
                                                            scale: 1.1,
                                                            child: Radio<
                                                                SortingOption>(
                                                              activeColor:
                                                                  Colors.black,
                                                              value:
                                                                  SortingOption
                                                                      .all,
                                                              groupValue:
                                                                  _sortingOption,
                                                              onChanged:
                                                                  (SortingOption?
                                                                      value) {
                                                                setState(() {
                                                                  _sortingOption =
                                                                      value ??
                                                                          SortingOption
                                                                              .all;
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Row(
                                            children: [
                                              Text(
                                                _sortingOption ==
                                                        SortingOption.fit
                                                    ? 'Phù hợp nhất'
                                                    : _sortingOption ==
                                                            SortingOption.newest
                                                        ? 'Mới nhất'
                                                        : 'Tất cả bình luận',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                                size: 20,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    for (int i = 0; i < comments.length; i++)
                                      SingleComment(
                                        comment: comments[i],
                                        level: 0,
                                      ),
                                  ],
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
            ),
          )
        : const SizedBox();
  }
}
