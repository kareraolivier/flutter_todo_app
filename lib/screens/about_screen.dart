import 'package:flutter/material.dart';

import '../components/nav_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text(
          "About",
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
