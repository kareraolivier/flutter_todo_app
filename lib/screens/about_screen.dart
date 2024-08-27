import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/models/user.dart';
import '../components/nav_bar.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutUserListState createState() => _AboutUserListState();
}

class _AboutUserListState extends State<AboutScreen> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    _getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    }).catchError((error) {
      print("Failed to fetch users: $error");
    });
  }

  Future<String> _getUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
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
                      arguments: users[index]);
                },
              ),
            ),
      bottomNavigationBar: NavBar(),
    );
  }
}
