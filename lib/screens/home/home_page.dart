import 'package:flutter/material.dart';
import 'package:uts_flutter/app/models/user.dart';
import 'package:uts_flutter/app/services/database.dart';

class HomePage extends StatefulWidget {

  final User user ;
  HomePage({super.key, required this.user  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Home') ,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${widget.user.name}'),
            Text('${widget.user.username}'),
            Text('${widget.user.email}'),
            FloatingActionButton(onPressed: (){})
          ],
        ),
      ),
    );
  }
}
