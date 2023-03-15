import '../Helpers/UsersModal.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UsersModal? _user;

  UsersModal? get user => _user;

  void setUser(UsersModal user) {
    _user = user;
    notifyListeners();
  }
}
