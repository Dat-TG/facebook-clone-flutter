import 'package:facebook/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final User _user = User(
    name: 'Lê Công Đắt',
    avatar: 'assets/images/user/lcd.jpg',
  );
  User get user => _user;
}
