import 'package:flutter/material.dart';
import '../navbar.dart';

class Home extends StatelessWidget {
  static const String id = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Text("This is Search",
        style: TextStyle(
          color: Colors.black,
          fontSize: 40.0,
          fontStyle: FontStyle.italic,
        ),
      ), 
      ),
        bottomNavigationBar: Navbar(),
    );
  }
}