/*

TODO REPOSITORY

here we will decide what the app can do

we basically declare the CRUD operations here


*/

import 'package:todoapp_bloc/domain/module/todo.dart';

abstract class TodoRepo {
  //get the list of todos
  Future<List<Todo>> getTodos();

  //create new todos
  Future<void> addTodo(Todo newTodo);

  //update the existing todos
  Future<void> updateTodo(Todo oldTodo);

  //delete the todos
  Future<void> deleteTodo(Todo todo);
}

/*

Notes:

the repo in this domain layer outlines the functionalities(operations the app can perform) of the app,
but doesn't worry about the specific implementation details,thats for the data layer

Technology agonostic,independent of the database and the framework

*/