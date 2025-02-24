/*

ISAR TODO MODEL

basically we will be converting the todo model into isar todo model so that we can store in isar db


*/

import 'package:isar/isar.dart';
import 'package:todoapp_bloc/domain/module/todo.dart';

//to generate the isar  todo object
part 'hisar_db_todo.g.dart';

@collection
class IsarTodo {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  //convert a isar object to a pure todo object to use it in our app
  Todo toDomain() {
    return Todo(id: id, content: text, isCompleted: isCompleted);
  }

  //converting an todo object to isartodo to store in the isar database
  static IsarTodo fromDomain(Todo todo) {
    return IsarTodo()
      ..id = todo.id!
      ..text = todo.content
      ..isCompleted = todo.isCompleted;
  }
}
