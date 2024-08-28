import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> fetchData(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return await json.decode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  } catch (error) {
    throw Exception('Failed to fetch data: $error');
  }
}
