import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/cubits/todo_cubit.dart';

class TodosContent extends StatelessWidget {
  const TodosContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoState = context.watch<TodoCubit>().state;

    if (todoState is TodoInitial) {
      context.read<TodoCubit>().getTodos();
      return const SizedBox.shrink();
    }

    if (todoState is TodoLoadingInProgress) {
      return const Center(child: CircularProgressIndicator());
    }

    if (todoState is TodoError) {
      return Center(child: Text(todoState.errorMessage));
    }

    if (todoState is TodoLoaded) {
      return (todoState.todos.isEmpty)
          ? const Center(child: Text('Empty'))
          : ListView.builder(
              itemCount: todoState.todos.length,
              itemBuilder: (BuildContext context, int index) {
                double topMargin = (index == 0) ? 10 : 3;
                return Opacity(
                  opacity: todoState.todos[index].completed ? 0.5 : 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, topMargin, 8, 3),
                    child: Card(
                      color: todoState.todos[index].completed
                          ? Colors.grey.shade200
                          : Colors.deepOrange.shade50,
                      child: ListTile(
                          title: Text(todoState.todos[index].title),
                          subtitle:
                              Text('User: ${todoState.todos[index].userId}'),
                          trailing: todoState.todos[index].completed
                              ? const Text('Done')
                              : const Text('Do it!')),
                    ),
                  ),
                );
              });
    }

    return const SizedBox.shrink();
  }
}
