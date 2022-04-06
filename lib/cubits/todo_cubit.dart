import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/models/todo.dart';
import '../data/repositories/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _todoRepository;

  TodoCubit({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(TodoInitial());

  Future<void> getTodos() async {
    emit(TodoLoadingInProgress());
    try {
      List<Todo> todos = await _todoRepository.loadTodos();
      emit(TodoLoaded(todos: todos));
    } on Exception {
      emit(const TodoError(errorMessage: 'Could not fetch the list'));
    }
  }

  void clearTodos() {
    emit(const TodoLoaded(todos: []));
  }
}
