import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/src/api/models/todo_list.dart';
import 'package:todoapp/src/widgets/items.dart';
import 'package:todoapp/src/widgets/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.calendar_month_outlined, color: Colors.white),

        backgroundColor: Colors.teal,
        //centerTitle: true,
        title: Text(
          "TO DO LIST",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: "Helvetica",
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(todoList[index].id.toString()),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                context.pushNamed(
                  'update_todo',
                  pathParameters: {'id': todoList[index].id.toString()},
                  extra: todoList[index],
                );
                return false;
              }

              // return await Utils.showConfirm(
              //   context: context,
              //   confirmButton: () {
              //     context.pop(todoList.remove(todoList[index]));
              //   },
              // );
            },

            child: Item(todo: todoList[index]),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}
