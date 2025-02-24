import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoapp_bloc/data/module/hisar_db_todo.dart';
import 'package:todoapp_bloc/data/repository/db_todo_repo.dart';
import 'package:todoapp_bloc/domain/repository/todo_repo.dart';
import 'package:todoapp_bloc/presentation/todo_page.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //it checks the binding of the widgets

  //get the directory for the database
  final dir = await getApplicationCacheDirectory();

  //and then open the isar database
  final isar = await Isar.open([IsarTodoSchema], directory: dir.path);

  //intialize our todorepo
  final isarTodorepo = IsartodoRepo(isar, db: isar);

  runApp(MyApp(
    todorepo: isarTodorepo,
  ));
}

class MyApp extends StatelessWidget {
  final TodoRepo todorepo;
  const MyApp({super.key, required this.todorepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todorepo),
    );
  }
}
