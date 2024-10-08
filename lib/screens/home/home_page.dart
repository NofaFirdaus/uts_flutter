import 'package:flutter/material.dart';
import 'package:uts_flutter/app/models/user.dart';

class HomePage extends StatelessWidget {
  final User user ;
  HomePage({super.key,required this.user});
  void cek () {
    print(user.name);
    print(user.username);
    print(user.email);
    print(user.password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Home') ,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(onPressed: (){cek();})
          ],
        ),
      ),
    );
  }
}
