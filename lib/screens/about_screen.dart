import '../api/fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/user.dart';
import '../components/nav_bar.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutUserListState createState() => _AboutUserListState();
}

Future<List<User>> fetchUsers(String url) async {
  Iterable response = await fetchData(url);
  return response.map((model) => User.fromJson(model)).toList();
}

class _AboutUserListState extends State<AboutScreen> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    fetchUsers('https://jsonplaceholder.typicode.com/users').then((userList) {
      setState(() {
        users = userList;
      });
    }).catchError((error) {
      print("Failed to fetch users: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Change this to your desired color
        ),
        backgroundColor: Colors.blue,
      ),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(users[index].name),
                subtitle: Text(users[index].email),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pushNamed(context, '/profile',
                      arguments: users[index].id);
                },
              ),
            ),
      bottomNavigationBar: NavBar(),
    );
  }
}
