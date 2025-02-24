/*

TODO CUBIT---it is for the simple state managemnet
each cubit is a list of todos

*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_bloc/domain/module/todo.dart';
import 'package:todoapp_bloc/domain/repository/todo_repo.dart';

class Todocubit extends Cubit<List<Todo>> {
  //reference the todorepo
  final TodoRepo todorepo;
  //initalize the cubit with a empty list and we will load the todos here
  Todocubit(this.todorepo) : super([]) {
    loadTodos();
  }

  //LOAD
  Future<void> loadTodos() async {
    final todolist = await todorepo.getTodos();
    //nownwe need to emit the fetched list as new state
    emit(todolist);
  }

  //ADD
  Future<void> addTodos(String text) async {
    //we need to create a new todo with a unique id
    final newtodo =
        Todo(id: DateTime.now().microsecondsSinceEpoch, content: text);
    //then we need to save it to the repo
    await todorepo.addTodo(newtodo);
    //then we will reload everything
    await loadTodos();
  }

  //TOGGLE
  Future<void> toggleTodos(Todo todo) async {
    //update the bool from the todo
    final updatedtodo = todo.toggleCompletion();
    //update it to the repo
    await todorepo.updateTodo(updatedtodo);
    //re-load the list
    loadTodos();
  }

  //DELETE
  Future<void> deleteTodos(Todo todo) async {
    //delete the provided todo from the rep
    await todorepo.deleteTodo(todo);
    //re-load
    loadTodos();
  }
}
