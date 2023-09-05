import 'package:facebook/models/user.dart';

class Product {
  final String name;
  final int price;
  final User user;
  final String status;
  final String description;
  final String location;
  final List<String> images;
  Product({
    required this.name,
    required this.price,
    required this.user,
    required this.status,
    required this.description,
    required this.location,
    required this.images,
  });
}
