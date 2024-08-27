import 'package:flutter/material.dart';

import '../components/nav_bar.dart';
import '../models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}', style: TextStyle(fontSize: 24)),
            Text('Username: ${user.username}', style: TextStyle(fontSize: 18)),
            Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
            Text('Phone: ${user.phone}', style: TextStyle(fontSize: 18)),
            Text('Website: ${user.website}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Address:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Street: ${user.address.street}',
                style: TextStyle(fontSize: 18)),
            Text('Suite: ${user.address.suite}',
                style: TextStyle(fontSize: 18)),
            Text('City: ${user.address.city}', style: TextStyle(fontSize: 18)),
            Text('Zipcode: ${user.address.zipcode}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Company:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Name: ${user.company.name}', style: TextStyle(fontSize: 18)),
            Text('Catch Phrase: ${user.company.catchPhrase}',
                style: TextStyle(fontSize: 18)),
            Text('Business: ${user.company.bs}',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
