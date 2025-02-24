import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_bloc/domain/repository/todo_repo.dart';
import 'package:todoapp_bloc/presentation/todo_cubit.dart';
import 'package:todoapp_bloc/presentation/todo_view.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;
  const TodoPage({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => Todocubit(todoRepo), child: const TodoView());
  }
}
