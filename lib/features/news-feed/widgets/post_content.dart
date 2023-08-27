import 'package:flutter/material.dart';

class PostContent extends StatefulWidget {
  final String text;
  const PostContent({super.key, required this.text});

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  String first = '';
  bool expand = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.text.length > 135) {
        first = widget.text.substring(0, 135);
        for (int i = 0; i < 135; i++) {
          if (widget.text[i] == '\n') {
            first = widget.text.substring(0, i);
            break;
          }
        }
      } else {
        first = widget.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          expand = !expand;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: widget.text.length == first.length
            ? Text(
                first,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              )
            : !expand
                ? RichText(
                    text: TextSpan(
                        text: "$first...",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        children: [
                          WidgetSpan(
                              child: InkWell(
                            onTap: () {
                              setState(() {
                                expand = !expand;
                              });
                            },
                            child: const Text(
                              'Xem thêm',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                          ))
                        ]),
                  )
                : Text(
                    widget.text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
      ),
    );
  }
}
