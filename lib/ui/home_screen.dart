import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/cubits/todo_cubit.dart';
import 'widgets/todos_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Todo"),
      ),
      body: Column(
        children: [
          const Expanded(child: TodosContent()),
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: context.read<TodoCubit>().getTodos,
                  child: const Text('Reload'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: context.read<TodoCubit>().clearTodos,
                  child: const Text('Clear'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
