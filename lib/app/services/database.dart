import 'package:uts_flutter/app/models/user.dart';

class Database {
  List<User>users = [];
  void create (a){
    users.add(a);
  }
    User? authenticate(String username, String password) {
    for (User user in users) {
      if (user.username == username && user.password == password) {
        return user;
      }
    }
    return null;
  }
    void show() {
    for (User user in users) {
        print(user.username);
        print(user.password);
      }
    }
     bool isUsernameTaken(String username) {
    for (User user in users) {
      if (user.username == username) {
        return true;
      }
    }
    return false;
  }
  }

