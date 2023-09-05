import 'package:flutter/material.dart';

class ProductDescription extends StatefulWidget {
  final String text;
  const ProductDescription({super.key, required this.text});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  String first = '';
  bool expand = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.text.length > 500) {
        first = widget.text.substring(0, 500);
      } else {
        first = widget.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 20),
        child: widget.text.length == first.length
            ? Text(
                first,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            : !expand
                ? RichText(
                    text: TextSpan(
                        text: "$first...",
                        style: const TextStyle(
                          fontSize: 16,
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
                              ' Xem tất cả',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ))
                        ]),
                  )
                : RichText(
                    text: TextSpan(
                        text: widget.text,
                        style: const TextStyle(
                          fontSize: 16,
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
                              ' Ẩn bớt',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ))
                        ]),
                  ));
  }
}
