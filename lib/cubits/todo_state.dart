part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

// TodoInitial
class TodoInitial extends TodoState {}

// TodoInitial
class TodoLoadingInProgress extends TodoState {}

// TodoLoaded
class TodoLoaded extends TodoState {
  final List<Todo> todos;
  const TodoLoaded({required this.todos});

  @override
  List<Object> get props => [todos];
}

// TodoError
class TodoError extends TodoState {
  final String errorMessage;
  const TodoError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
