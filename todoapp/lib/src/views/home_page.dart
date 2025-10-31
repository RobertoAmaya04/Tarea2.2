import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/src/api/models/todo_model.dart';
import 'package:todoapp/src/api/models/user.dart';
import 'package:todoapp/src/widgets/items.dart';

class HomePage extends StatelessWidget {
  final User? user;
  const HomePage({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // mira una opcion es poner en chiquito el nombre del usuario en el appbar
        // si te animas seria algo como => Text(user!.name, Style: TextStyle())
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
        itemCount: user!.todoList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(user!.todoList[index].id.toString()),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                final result = await context.pushNamed(
                  'update_todo',
                  pathParameters: {'id': user!.todoList[index].id.toString()},
                  extra: user!.todoList[index],
                );
                user!.updateTodo(result as Todo);
                return false;
              }

              // return await Utils.showConfirm(
              //   context: context,
              //   confirmButton: () {
              //     context.pop(user!.todoList.remove(user!.todoList[index]));
              //   },
              // );
              // nose como lo haras la pantalla para preguntar si borrar, pero bueno solo
              // que te 
            },

            child: Item(todo: user!.todoList[index]),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final result = await context.pushNamed('create_todo') as Map;

          if (result != null) {
            user!.addTodo(
              Todo(
                id: user!.todoList.length,
                title: result['title'],
                description: result['description'],
                isCompleted: false,
              ),
            );
          }
        },
      ),
    );
  }
}
