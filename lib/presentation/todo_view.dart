/*
TODO VIEW---responsible for the UI part of the app
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_bloc/domain/module/todo.dart';
import 'package:todoapp_bloc/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    //todocubit
    final todocubit = context.read<Todocubit>();

    //  SCAFOLD
    return Scaffold(
      //FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addtodoBox(context),
        child: const Icon(
          Icons.add,
        ),
      ),
      body: BlocBuilder<Todocubit, List<Todo>>(builder: ((context, state) {
        return ListView.builder(
            itemCount: state.length,
            itemBuilder: ((context, index) {
              final indvtodo = state[index];
              return ListTile(
                //text
                title: Text(indvtodo.content),
                //checkbox
                leading: Checkbox(
                  onChanged: (value) => todocubit.toggleTodos(indvtodo),
                  value: indvtodo.isCompleted,
                ),
                //delete
                trailing: IconButton(
                    onPressed: () {
                      todocubit.deleteTodos(indvtodo);
                    },
                    icon: const Icon(Icons.delete)),
              );
            }));
      })),
    );
  }

  void _addtodoBox(BuildContext context) {
    final todocubit = context.read<Todocubit>();
    final textcontroller = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              controller: textcontroller,
            ),
            actions: [
              //cancel option
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "canel",
                    style: TextStyle(color: Colors.grey),
                  )),
              //save option
              TextButton(
                  onPressed: () {
                    todocubit.addTodos(textcontroller.text);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "save",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          );
        });
  }
}
