import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class TodoService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Todo>> fetchData() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/todos'));
      final todosJsonArr = (jsonDecode(response.body) as List<dynamic>);
      return todosJsonArr.map((json) => Todo.fromJson(json)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
