import 'package:facebook/constants/global_variables.dart';
import 'package:facebook/features/news-feed/widgets/post_content.dart';
import 'package:facebook/models/post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(widget.post.user.avatar),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            widget.post.user.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.post.time,
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 14),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Icon(
                                  Icons.circle,
                                  size: 2,
                                ),
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
                                color: Colors.black87,
                                size: 14,
                              )
                            ],
                          ),
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
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded),
                  ),
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: PostContent(text: widget.post.content!),
        ),
        Image.network(
          widget.post.image![0],
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
