import 'package:uts_flutter/app/models/user.dart';

class Database {
  List<User> users = [];

  void create(a) {
    users.add(a);
  }

  User? authenticate(
      {required String usernameOrUsername, required String password}) {
    for (User user in users) {
      if (user.username == usernameOrUsername && user.password == password ||
          user.email == usernameOrUsername && user.password == password) {
        return user;
      }
    }
    return null;
  }

  void show() {
    for (User user in users) {
      print('username ${user.username}');
      print("password ${user.password}");
    }
  }

  bool isUsernameEmailTaken(String username, String email) {
    for (User user in users) {
      if (user.username == username && user.email == email) {
        return true;
      }
    }
    return false;
  }

  bool validatorUsername(String username) {
    for (User user in users) {
      if (user.username == username) {
        return false;
      }
    }
    return true;
  }

  bool validatorEmail(String email) {
    for (User user in users) {
      if (user.email == email) {
        return false;
      }
    }
    return true;
  }
}
