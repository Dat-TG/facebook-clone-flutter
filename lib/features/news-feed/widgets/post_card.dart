import 'dart:async';
import 'dart:math';

import 'package:facebook/constants/global_variables.dart';
import 'package:facebook/features/comment/screens/comment_screen.dart';
import 'package:facebook/features/news-feed/screen/image_fullscreen.dart';
import 'package:facebook/features/news-feed/screen/multiple_images_post_screen.dart';
import 'package:facebook/features/news-feed/widgets/post_content.dart';
import 'package:facebook/models/post.dart';
import 'package:flutter/material.dart';

import '../../personal-page/screens/personal_page_screen.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool postVisible = true;
  List<String> icons = [];
  String reactions = '0';
  double leftImageHeight = 0;
  @override
  void initState() {
    super.initState();
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
    _calculateImageDimension();
  }

  _calculateImageDimension() async {
    Completer<Size> completer = Completer();
    Image image = Image.asset(widget.post.image![0]);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );
    await completer.future.then((value) {
      setState(() {
        if (widget.post.image!.length > 2 && widget.post.image!.length < 5) {
          leftImageHeight = MediaQuery.of(context).size.width *
              2 /
              3 *
              0.99 *
              value.height /
              value.width;
        } else {
          leftImageHeight = MediaQuery.of(context).size.width /
              2 *
              0.99 *
              value.height /
              value.width;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return postVisible
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                            radius: 20,
                            backgroundImage:
                                AssetImage(widget.post.user.avatar),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          PersonalPageScreen.routeName,
                                          arguments: widget.post.user,
                                        );
                                      },
                                      child: Text(
                                        widget.post.user.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    (widget.post.user.verified == true
                                        ? const Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Icon(
                                              Icons.verified,
                                              color: Colors.blue,
                                              size: 15,
                                            ),
                                          )
                                        : const SizedBox()),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.post.time,
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 2),
                                    child: Icon(
                                      Icons.circle,
                                      size: 2,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    widget.post.shareWith == 'public'
                                        ? Icons.public
                                        : widget.post.shareWith == 'friends'
                                            ? Icons.people
                                            : widget.post.shareWith ==
                                                    'friends-of-frends'
                                                ? Icons.groups
                                                : Icons.lock,
                                    color: Colors.black54,
                                    size: 14,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return DecoratedBox(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    color: Colors.grey[300],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 4,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Column(
                                          children: [
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {},
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                child: const ListTile(
                                                  titleAlignment:
                                                      ListTileTitleAlignment
                                                          .center,
                                                  tileColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  minLeadingWidth: 10,
                                                  leading: Icon(
                                                    Icons.add_circle_rounded,
                                                    size: 30,
                                                    color: Colors.black,
                                                  ),
                                                  title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Hiển thị thêm',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Bạn sẽ nhìn thấy nhiều bài viết tương tự hơn.',
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                ),
                                                onTap: () {},
                                                child: const ListTile(
                                                  titleAlignment:
                                                      ListTileTitleAlignment
                                                          .center,
                                                  tileColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  minLeadingWidth: 10,
                                                  leading: Icon(
                                                    Icons.remove_circle,
                                                    size: 30,
                                                    color: Colors.black,
                                                  ),
                                                  title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Ẩn bớt',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Bạn sẽ nhìn thấy ít bài viết tương tự hơn.',
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                onTap: () {},
                                                child: const ListTile(
                                                  tileColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  minLeadingWidth: 10,
                                                  titleAlignment:
                                                      ListTileTitleAlignment
                                                          .center,
                                                  leading: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 2.5,
                                                    ),
                                                    child: ImageIcon(
                                                      AssetImage(
                                                          'assets/images/save-fill.png'),
                                                      size: 25,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Lưu bài viết',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Thêm vào danh sách các mục đã lưu.',
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {},
                                                child: ListTile(
                                                  titleAlignment:
                                                      ListTileTitleAlignment
                                                          .center,
                                                  tileColor: Colors.white,
                                                  minLeadingWidth: 10,
                                                  leading: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 5,
                                                      vertical: 2,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: const Icon(
                                                      Icons.close,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  title: const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Ẩn bài viết',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Ẩn bớt các bài viết tương tự.',
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {},
                                                child: ListTile(
                                                  tileColor: Colors.white,
                                                  minLeadingWidth: 10,
                                                  titleAlignment:
                                                      ListTileTitleAlignment
                                                          .center,
                                                  leading: const Icon(
                                                    Icons.feedback_rounded,
                                                    size: 30,
                                                    color: Colors.black,
                                                  ),
                                                  title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Báo cáo bài viết',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Chúng tôi sẽ không cho ${widget.post.user.name} biết ai đã báo cáo.',
                                                        style: const TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 14,
                                                          height: 1.4,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {},
                                                child: const ListTile(
                                                  titleAlignment:
                                                      ListTileTitleAlignment
                                                          .center,
                                                  tileColor: Colors.white,
                                                  minLeadingWidth: 10,
                                                  leading: ImageIcon(
                                                    AssetImage(
                                                        'assets/images/noti-fill.png'),
                                                    color: Colors.black,
                                                    size: 30,
                                                  ),
                                                  title: Text(
                                                    'Bật thông báo về bài viết này',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                ),
                                                onTap: () {},
                                                child: const ListTile(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  titleAlignment:
                                                      ListTileTitleAlignment
                                                          .center,
                                                  tileColor: Colors.white,
                                                  minLeadingWidth: 10,
                                                  leading: Icon(
                                                    Icons.file_copy_rounded,
                                                    color: Colors.black,
                                                    size: 30,
                                                  ),
                                                  title: Text(
                                                    'Sao chép liên kết',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                onTap: () {},
                                                child: ListTile(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  tileColor: Colors.white,
                                                  minLeadingWidth: 10,
                                                  titleAlignment:
                                                      ListTileTitleAlignment
                                                          .center,
                                                  leading: const Icon(
                                                    Icons.star_rounded,
                                                    size: 30,
                                                    color: Colors.black,
                                                  ),
                                                  title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Thêm ${widget.post.user.name} vào mục Yêu thích',
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      const Text(
                                                        'Ưu tiên bài viết của họ trong Bảng tin',
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 14,
                                                          height: 1.4,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {},
                                                child: ListTile(
                                                  tileColor: Colors.white,
                                                  minLeadingWidth: 10,
                                                  titleAlignment:
                                                      ListTileTitleAlignment
                                                          .center,
                                                  leading: const Icon(
                                                    Icons.access_time_filled,
                                                    size: 30,
                                                    color: Colors.black,
                                                  ),
                                                  title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Tạm ẩn ${widget.post.user.name} trong 30 ngày.',
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      const Text(
                                                        'Tạm thời không nhìn thấy bài viết nữa.',
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 14,
                                                          height: 1.4,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                ),
                                                onTap: () {},
                                                child: ListTile(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10),
                                                    ),
                                                  ),
                                                  tileColor: Colors.white,
                                                  minLeadingWidth: 10,
                                                  titleAlignment:
                                                      ListTileTitleAlignment
                                                          .center,
                                                  leading: const ImageIcon(
                                                    AssetImage(
                                                        'assets/images/unfollow.png'),
                                                    size: 30,
                                                    color: Colors.black,
                                                  ),
                                                  title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Bỏ theo dõi ${widget.post.user.name}',
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      const Text(
                                                        'Không xem bài viết của Trang này nữa.',
                                                        style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 14,
                                                          height: 1.4,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                onTap: () {},
                                                child: ListTile(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  tileColor: Colors.white,
                                                  minLeadingWidth: 10,
                                                  titleAlignment:
                                                      ListTileTitleAlignment
                                                          .center,
                                                  leading: const Icon(
                                                    Icons.view_list_rounded,
                                                    size: 30,
                                                    color: Colors.black,
                                                  ),
                                                  title: const Text(
                                                    'Quản lý bảng feed',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.more_horiz_rounded),
                        ),
                        if (widget.post.type != 'memory')
                          IconButton(
                            splashRadius: 20,
                            onPressed: () {
                              setState(() {
                                postVisible = false;
                              });
                            },
                            icon: const Icon(Icons.close),
                          ),
                      ],
                    )
                  ],
                ),
              ),
              if (widget.post.layout != 'quote')
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: PostContent(text: widget.post.content!),
                ),
              ((widget.post.video != null ? widget.post.video!.length : 0) +
                          (widget.post.image != null
                              ? widget.post.image!.length
                              : 0) ==
                      1)
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ImageFullScreen.routeName,
                            arguments: widget.post);
                      },
                      child: Image.asset((widget.post.image != null)
                          ? widget.post.image![0]
                          : widget.post.video![0]),
                    )
                  : (widget.post.layout == 'classic' ||
                          (widget.post.layout == 'frame' &&
                              widget.post.image!.length >= 5))
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      MultipleImagesPostScreen.routeName,
                                      arguments: widget.post,
                                    );
                                  },
                                  child: Image.asset(
                                    widget.post.image![0],
                                    width: (widget.post.image!.length > 2 &&
                                            widget.post.image!.length < 5)
                                        ? MediaQuery.of(context).size.width *
                                            2 /
                                            3 *
                                            0.99
                                        : MediaQuery.of(context).size.width /
                                            2 *
                                            0.99,
                                    height: widget.post.image!.length >= 5
                                        ? leftImageHeight / 2 -
                                            MediaQuery.of(context).size.width /
                                                2 *
                                                0.005
                                        : leftImageHeight,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (widget.post.image!.length >= 5)
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.width /
                                            2 *
                                            0.01),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          MultipleImagesPostScreen.routeName,
                                          arguments: widget.post,
                                        );
                                      },
                                      child: Image.asset(
                                        widget.post.image![1],
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2 *
                                                0.99,
                                        height: leftImageHeight / 2 -
                                            MediaQuery.of(context).size.width /
                                                2 *
                                                0.005,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(
                              width: widget.post.image!.length > 2 &&
                                      widget.post.image!.length < 5
                                  ? MediaQuery.of(context).size.width *
                                      2 /
                                      3 *
                                      0.01
                                  : MediaQuery.of(context).size.width /
                                      2 *
                                      0.02,
                            ),
                            ((widget.post.video != null
                                            ? widget.post.video!.length
                                            : 0) +
                                        (widget.post.image != null
                                            ? widget.post.image!.length
                                            : 0) >
                                    1)
                                ? Column(
                                    children: [
                                      for (int i = widget.post.image!.length < 5
                                              ? 1
                                              : 2;
                                          i < min(widget.post.image!.length, 5);
                                          i++)
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 0,
                                            bottom: i <
                                                    widget.post.image!.length -
                                                        1
                                                ? widget.post.image!.length >
                                                            2 &&
                                                        widget.post.image!
                                                                .length <
                                                            5
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        2 /
                                                        3 *
                                                        0.01
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 *
                                                        0.01
                                                : 0,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                MultipleImagesPostScreen
                                                    .routeName,
                                                arguments: widget.post,
                                              );
                                            },
                                            child: Stack(
                                              children: [
                                                Image.asset(
                                                  widget.post.image![i],
                                                  width: widget.post.image!
                                                                  .length >
                                                              2 &&
                                                          widget.post.image!
                                                                  .length <
                                                              5
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          3
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 *
                                                          0.99,
                                                  height: i <
                                                          widget.post.image!
                                                                  .length -
                                                              1
                                                      ? widget.post.image!
                                                                  .length <
                                                              5
                                                          ? leftImageHeight /
                                                                  (widget
                                                                          .post
                                                                          .image!
                                                                          .length -
                                                                      1) -
                                                              MediaQuery.of(context)
                                                                      .size
                                                                      .width *
                                                                  2 /
                                                                  3 *
                                                                  0.01
                                                          : leftImageHeight / 3 -
                                                              MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 *
                                                                  0.01
                                                      : widget.post.image!
                                                                  .length <
                                                              5
                                                          ? leftImageHeight /
                                                              (widget
                                                                      .post
                                                                      .image!
                                                                      .length -
                                                                  1)
                                                          : leftImageHeight / 3,
                                                  fit: BoxFit.cover,
                                                ),
                                                if (i == 4 &&
                                                    widget.post.image!.length >
                                                        5)
                                                  Positioned.fill(
                                                    child: Center(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        color: Colors.black
                                                            .withOpacity(0.3),
                                                        child: Text(
                                                          '+${widget.post.image!.length - i - 1}',
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  )
                                : const SizedBox(),
                          ],
                        )
                      : widget.post.layout == 'column'
                          ? Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: const EdgeInsets.all(0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: Colors.black12, width: 0.5),
                                ),
                              ),
                              child: Row(
                                children: [
                                  for (int i = 0;
                                      i < min(widget.post.image!.length, 4);
                                      i++)
                                    Padding(
                                      padding: i % 2 == 0
                                          ? i <
                                                  min(widget.post.image!.length,
                                                          4) -
                                                      1
                                              ? EdgeInsets.only(
                                                  right: 3,
                                                  bottom: widget.post.image!
                                                              .length >
                                                          2
                                                      ? 10
                                                      : 0,
                                                )
                                              : EdgeInsets.only(
                                                  bottom: widget.post.image!
                                                              .length >
                                                          2
                                                      ? 10
                                                      : 0,
                                                )
                                          : i <
                                                  min(widget.post.image!.length,
                                                          4) -
                                                      1
                                              ? EdgeInsets.only(
                                                  right: 3,
                                                  top: widget.post.image!
                                                              .length >
                                                          2
                                                      ? 10
                                                      : 0,
                                                )
                                              : EdgeInsets.only(
                                                  top: widget.post.image!
                                                              .length >
                                                          2
                                                      ? 10
                                                      : 0,
                                                ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              MultipleImagesPostScreen
                                                  .routeName,
                                              arguments: widget.post,
                                            );
                                          },
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                widget.post.image![i],
                                                width: (MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        (min(
                                                                    widget
                                                                        .post
                                                                        .image!
                                                                        .length,
                                                                    4) -
                                                                1) *
                                                            3) /
                                                    (min(
                                                        widget
                                                            .post.image!.length,
                                                        4)),
                                                fit: BoxFit.cover,
                                                height:
                                                    min(leftImageHeight, 300),
                                              ),
                                              if (i == 3 &&
                                                  widget.post.image!.length > 4)
                                                Positioned.fill(
                                                  child: Center(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      color: Colors.black
                                                          .withOpacity(0.3),
                                                      child: Text(
                                                        '+${widget.post.image!.length - i - 1}',
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            )
                          : widget.post.layout == 'quote'
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            MultipleImagesPostScreen.routeName,
                                            arguments: widget.post,
                                          );
                                        },
                                        child: Image.asset(
                                          widget.post.image![0],
                                          width: double.infinity,
                                          height: min(200, leftImageHeight),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                        child: Text(
                                      widget.post.content!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          for (int i = 1;
                                              i <
                                                  min(widget.post.image!.length,
                                                      5);
                                              i++)
                                            Padding(
                                              padding: i % 2 == 0
                                                  ? i <
                                                          min(
                                                                  widget
                                                                      .post
                                                                      .image!
                                                                      .length,
                                                                  5) -
                                                              1
                                                      ? const EdgeInsets.only(
                                                          right: 5,
                                                        )
                                                      : EdgeInsets.zero
                                                  : i <
                                                          min(
                                                                  widget
                                                                      .post
                                                                      .image!
                                                                      .length,
                                                                  5) -
                                                              1
                                                      ? const EdgeInsets.only(
                                                          right: 5,
                                                        )
                                                      : EdgeInsets.zero,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                    context,
                                                    MultipleImagesPostScreen
                                                        .routeName,
                                                    arguments: widget.post,
                                                  );
                                                },
                                                child: Stack(
                                                  children: [
                                                    Image.asset(
                                                      widget.post.image![i],
                                                      width: (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              20 -
                                                              (min(
                                                                          widget
                                                                              .post
                                                                              .image!
                                                                              .length,
                                                                          5) -
                                                                      2) *
                                                                  5) /
                                                          (min(
                                                                  widget
                                                                      .post
                                                                      .image!
                                                                      .length,
                                                                  5) -
                                                              1),
                                                      fit: BoxFit.cover,
                                                      height: min(
                                                          leftImageHeight, 200),
                                                    ),
                                                    if (i == 4 &&
                                                        widget.post.image!
                                                                .length >
                                                            5)
                                                      Positioned.fill(
                                                        child: Center(
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.3),
                                                            child: Text(
                                                              '+${widget.post.image!.length - i - 1}',
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              : Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  color: Colors.grey.withOpacity(0.5),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  MultipleImagesPostScreen
                                                      .routeName,
                                                  arguments: widget.post,
                                                );
                                              },
                                              child: Image.asset(
                                                widget.post.image![0],
                                                width: (MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        40) /
                                                    2 *
                                                    0.95,
                                                height:
                                                    widget.post.image!.length >=
                                                            4
                                                        ? leftImageHeight / 2
                                                        : leftImageHeight,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            if (widget.post.image!.length >= 4)
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: (MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            40) /
                                                        2 *
                                                        0.05),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                      context,
                                                      MultipleImagesPostScreen
                                                          .routeName,
                                                      arguments: widget.post,
                                                    );
                                                  },
                                                  child: Image.asset(
                                                    widget.post.image![1],
                                                    width:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width -
                                                                40) /
                                                            2 *
                                                            0.95,
                                                    height: leftImageHeight / 2,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    40) /
                                                2 *
                                                0.05,
                                      ),
                                      ((widget.post.video != null
                                                      ? widget
                                                          .post.video!.length
                                                      : 0) +
                                                  (widget.post.image != null
                                                      ? widget
                                                          .post.image!.length
                                                      : 0) >
                                              1)
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Column(
                                                children: [
                                                  for (int i = widget
                                                                  .post
                                                                  .image!
                                                                  .length <
                                                              4
                                                          ? 1
                                                          : 2;
                                                      i <
                                                          min(
                                                              widget.post.image!
                                                                  .length,
                                                              5);
                                                      i++)
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 0,
                                                        bottom: i <
                                                                widget
                                                                        .post
                                                                        .image!
                                                                        .length -
                                                                    1
                                                            ? (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    40) /
                                                                2 *
                                                                0.05
                                                            : 0,
                                                      ),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.pushNamed(
                                                            context,
                                                            MultipleImagesPostScreen
                                                                .routeName,
                                                            arguments:
                                                                widget.post,
                                                          );
                                                        },
                                                        child: Stack(
                                                          children: [
                                                            Image.asset(
                                                              widget.post
                                                                  .image![i],
                                                              width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      40) /
                                                                  2 *
                                                                  0.95,
                                                              height: i <
                                                                      widget.post.image!
                                                                              .length -
                                                                          1
                                                                  ? widget.post.image!
                                                                              .length <
                                                                          4
                                                                      ? leftImageHeight /
                                                                          (widget.post.image!.length -
                                                                              1)
                                                                      : leftImageHeight /
                                                                          2
                                                                  : widget.post.image!
                                                                              .length <
                                                                          4
                                                                      ? leftImageHeight /
                                                                          (widget.post.image!.length -
                                                                              1)
                                                                      : leftImageHeight /
                                                                          2,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            if (i == 4 &&
                                                                widget
                                                                        .post
                                                                        .image!
                                                                        .length >
                                                                    5)
                                                              Positioned.fill(
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.3),
                                                                    child: Text(
                                                                      '+${widget.post.image!.length - i - 1}',
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            18,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CommentScreen.routeName,
                        arguments: widget.post);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 8,
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            widget.post.comment != null
                                ? Text(
                                    '${widget.post.comment} bình luận',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ),
                                  )
                                : const SizedBox(),
                            (widget.post.comment != null &&
                                    widget.post.share != null)
                                ? const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Icon(
                                      Icons.circle,
                                      size: 3,
                                      color: Colors.black54,
                                    ),
                                  )
                                : const SizedBox(),
                            widget.post.share != null
                                ? Text(
                                    '${widget.post.share} lượt chia sẻ',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (widget.post.type != 'memory')
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    color: Colors.black38,
                    height: 0,
                  ),
                ),
              if (widget.post.type != 'memory')
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 11.5,
                        ),
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 3,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage('assets/images/like.png'),
                              size: 24,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Thích',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 3,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage('assets/images/comment.png'),
                              size: 22,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Bình luận',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 3,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage('assets/images/share.png'),
                              size: 27,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Chia sẻ',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.visibility_off_rounded,
                      color: GlobalVariables.secondaryColor,
                      size: 14,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Đã ẩn',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Việc ẩn bài viết giúp Facebook cá nhân hóa Bảng feed của bạn.',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          postVisible = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Hoàn tác',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black12,
                  thickness: 0.5,
                  height: 20,
                ),
                Row(
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
                          widget.post.user.avatar,
                        ),
                        radius: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Tạm ẩn ${widget.post.user.name} trong 30 ngày',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(
                      Icons.feedback_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Báo cáo bài viết',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.view_list_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Quản lý Bảng feed',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
  }
}
