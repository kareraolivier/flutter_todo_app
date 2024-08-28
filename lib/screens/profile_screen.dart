import 'package:flutter/material.dart';
import '../components/nav_bar.dart';
import '../models/user.dart';
import '../api/fetch_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<User> fetchUserById(int id) async {
    final response =
        await fetchData('https://jsonplaceholder.typicode.com/users/$id');
    return User.fromJson(response);
  }

  @override
  Widget build(BuildContext context) {
    final int userId = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Change this to your desired color
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<User>(
        future: fetchUserById(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No user found.'));
          }

          final User user = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${user.name}', style: TextStyle(fontSize: 24)),
                Text('Username: ${user.username}',
                    style: TextStyle(fontSize: 18)),
                Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
                Text('Phone: ${user.phone}', style: TextStyle(fontSize: 18)),
                Text('Website: ${user.website}',
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                Text('Address:',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Street: ${user.address.street}',
                    style: TextStyle(fontSize: 18)),
                Text('Suite: ${user.address.suite}',
                    style: TextStyle(fontSize: 18)),
                Text('City: ${user.address.city}',
                    style: TextStyle(fontSize: 18)),
                Text('Zipcode: ${user.address.zipcode}',
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                Text('Company:',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Name: ${user.company.name}',
                    style: TextStyle(fontSize: 18)),
                Text('Catch Phrase: ${user.company.catchPhrase}',
                    style: TextStyle(fontSize: 18)),
                Text('Business: ${user.company.bs}',
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
