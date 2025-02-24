/*

DATABASE REPO

--is about the implementation in the isar database  like  updating,adding,deleting,getting the data in the isar database

*/

import 'package:isar/isar.dart';
import 'package:todoapp_bloc/data/module/hisar_db_todo.dart';
import 'package:todoapp_bloc/domain/module/todo.dart';
import 'package:todoapp_bloc/domain/repository/todo_repo.dart';

class IsartodoRepo implements TodoRepo {
  final Isar db;
  IsartodoRepo(Isar isar, {required this.db});

  //get the data
  @override
  Future<List<Todo>> getTodos() async {
    //fetch the data
    final todos = await db.isarTodos.where().findAll();
    //return the data to the domain layer
    return todos.map((isarTodo) => isarTodo.toDomain()).toList();
  }

  //add the data
  @override
  Future<void> addTodo(Todo newTodo) {
    final isarTodo = IsarTodo.fromDomain(newTodo);
    //add it to the db
    return db.writeTxn(() => db.isarTodos.put(isarTodo));
  }

  //update the data
  @override
  Future<void> updateTodo(Todo oldTodo) {
    //it is same as that of the addtodo thing
    final isarTodo = IsarTodo.fromDomain(oldTodo);
    //add it to the db
    return db.writeTxn(() => db.isarTodos.put(isarTodo));
  }

  //delete the data
  @override
  Future<void> deleteTodo(Todo todo) {
    return db.writeTxn(() => db.isarTodos.delete(todo.id!));
  }
}
