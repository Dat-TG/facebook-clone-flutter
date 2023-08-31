import 'package:facebook/models/noti.dart';
import 'package:flutter/material.dart';

class SingleNotification extends StatefulWidget {
  final Noti notification;
  const SingleNotification({super.key, required this.notification});

  @override
  State<SingleNotification> createState() => _SingleNotificationState();
}

class _SingleNotificationState extends State<SingleNotification> {
  List<String> texts = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      texts = [];
      int s = 0;
      if (widget.notification.bold != null) {
        for (int i = 0; i < widget.notification.bold!.length; i++) {
          int j =
              widget.notification.content.indexOf(widget.notification.bold![i]);
          texts.add(widget.notification.content.substring(s, j));
          texts.add(widget.notification.bold![i]);
          s = j + widget.notification.bold![i].length;
        }
      }

      texts.add(widget.notification.content
          .substring(s, widget.notification.content.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: widget.notification.seen == true
                ? Colors.white.withOpacity(0.1)
                : Colors.blue.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
              bottom: 10,
              right: 0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Stack(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black54,
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage(widget.notification.image),
                          radius: 40,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(0),
                          alignment: Alignment.center,
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.notification.type == 'friend'
                                  ? Colors.blue
                                  : widget.notification.type == 'comment'
                                      ? Colors.green[400]
                                      : widget.notification.type == 'page'
                                          ? Colors.orange
                                          : widget.notification.type == 'group'
                                              ? Colors.blue
                                              : widget.notification.type ==
                                                      'security'
                                                  ? Colors.blue
                                                  : widget.notification.type ==
                                                          'date'
                                                      ? Colors.purple
                                                      : widget.notification
                                                                  .type ==
                                                              'badge'
                                                          ? Colors
                                                              .yellow.shade700
                                                          : Colors.white),
                          child: (widget.notification.type == 'memory')
                              ? const Icon(
                                  Icons.facebook,
                                  color: Colors.blue,
                                  size: 30,
                                )
                              : (widget.notification.type == 'friend')
                                  ? const Icon(
                                      Icons.person_rounded,
                                      color: Colors.white,
                                      size: 22,
                                    )
                                  : (widget.notification.type == 'comment')
                                      ? const ImageIcon(
                                          AssetImage(
                                              'assets/images/white-cmt.png'),
                                          color: Colors.white,
                                          size: 16,
                                        )
                                      : (widget.notification.type == 'page')
                                          ? const CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/images/flag.png'))
                                          : (widget.notification.type ==
                                                  'group')
                                              ? const Icon(
                                                  Icons.groups_rounded,
                                                  color: Colors.white,
                                                  size: 24,
                                                )
                                              : (widget.notification.type ==
                                                      'security')
                                                  ? const Icon(
                                                      Icons.security_rounded,
                                                      color: Colors.white,
                                                      size: 20,
                                                    )
                                                  : (widget.notification.type ==
                                                          'date')
                                                      ? const Icon(
                                                          Icons
                                                              .favorite_rounded,
                                                          color: Colors.white,
                                                          size: 20,
                                                        )
                                                      : (widget.notification
                                                                  .type ==
                                                              'badge')
                                                          ? const ImageIcon(
                                                              AssetImage(
                                                                'assets/images/trophy.png',
                                                              ),
                                                              size: 18,
                                                              color:
                                                                  Colors.white,
                                                            )
                                                          : (widget.notification
                                                                      .type ==
                                                                  'like')
                                                              ? Image.asset(
                                                                  'assets/images/reactions/like.png')
                                                              : (widget.notification
                                                                          .type ==
                                                                      'love')
                                                                  ? Image.asset(
                                                                      'assets/images/reactions/love.png')
                                                                  : (widget.notification
                                                                              .type ==
                                                                          'haha')
                                                                      ? Image.asset(
                                                                          'assets/images/reactions/haha.png')
                                                                      : (widget.notification.type ==
                                                                              'wow')
                                                                          ? Image.asset(
                                                                              'assets/images/reactions/wow.png')
                                                                          : (widget.notification.type == 'lovelove')
                                                                              ? Image.asset('assets/images/reactions/care.png')
                                                                              : (widget.notification.type == 'sad')
                                                                                  ? Image.asset('assets/images/reactions/sad.png')
                                                                                  : (widget.notification.type == 'angry')
                                                                                      ? Image.asset('assets/images/reactions/angry.png')
                                                                                      : const Icon(
                                                                                          Icons.facebook,
                                                                                          color: Colors.blue,
                                                                                          size: 30,
                                                                                        ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          text: TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  height: 1.4),
                              children: texts
                                  .map(
                                    (e) => TextSpan(
                                      text: e,
                                      style: TextStyle(
                                        fontWeight:
                                            widget.notification.bold != null &&
                                                    widget.notification.bold!
                                                        .contains(e)
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                      ),
                                    ),
                                  )
                                  .toList()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            widget.notification.time,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        if (widget.notification.type == 'friend')
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.all(5),
                                  ),
                                  child: const Text(
                                    'Chấp nhận',
                                    style: TextStyle(color: Colors.white),
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
                                      elevation: 0,
                                      backgroundColor: const Color.fromARGB(
                                          237, 219, 218, 218),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.all(5)),
                                  child: const Text(
                                    'Xóa',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    padding: const EdgeInsets.all(5),
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz_rounded,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
