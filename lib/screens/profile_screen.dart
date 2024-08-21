import 'package:flutter/material.dart';

import '../components/nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text(
          "Profile",
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
