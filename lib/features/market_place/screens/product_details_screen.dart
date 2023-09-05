import 'package:facebook/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product-details';
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.black,
                    size: 25,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
