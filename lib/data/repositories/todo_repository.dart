import '../models/todo.dart';
import '../services/todo_service.dart';

class TodoRepository {
  TodoService service = TodoService();

  Future<List<Todo>> loadTodos() {
    return service.fetchData();
  }
}
