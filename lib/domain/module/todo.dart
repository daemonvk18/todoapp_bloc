/*

THIS A TODO MODEL APP

-------------------------------------------------

the attributes invovled in the todo model are

-id
-content
-iscompleted

------------------------------------------------

methods:

-toggling the iscompleted option


*/

class Todo {
  final int? id;
  final String content;
  final bool isCompleted;
  Todo(
      {required this.id,
      required this.content,
      this.isCompleted = false //intially let it be false
      });

  Todo toggleCompletion() {
    //we will be toggleing the iscompleted option
    return Todo(id: id, content: content, isCompleted: !isCompleted);
  }
}
