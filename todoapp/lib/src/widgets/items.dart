import 'package:flutter/material.dart';
import 'package:todoapp/src/api/models/todo_model.dart';

class Item extends StatefulWidget {
  final Todo todo;
  const Item({super.key, required this.todo});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    Todo todo = widget.todo;
    return ListTile(
      leading: IconButton(
        icon: todo.isCompleted
            ? Icon(Icons.check_circle, color: Colors.teal)
            : Icon(Icons.circle_outlined),

        onPressed: () {
          todo.isCompleted = todo.isCompleted ? false : true;
          setState(() {});
        },
      ),

      trailing: todo.isCompleted
          ? Icon(Icons.arrow_back_ios_sharp)
          : Icon(Icons.arrow_forward_ios_sharp),

      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      subtitle: Text(todo.description),
    );
  }
}
