import 'package:facebook/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final User _user = User(
    name: 'Lê Công Đắt',
    avatar:
        'https://scontent.fsgn5-10.fna.fbcdn.net/v/t39.30808-6/318493519_1198259884399429_381099977086172582_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=n5Big1aY7EwAX8Op479&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfCFHCJsdxPVikMDMhEYM8yoUq2cgH5rUwzfSCZG-ao2Bw&oe=64EE43CB',
  );
  User get user => _user;
}
