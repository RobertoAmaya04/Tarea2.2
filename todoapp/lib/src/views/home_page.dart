import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/src/api/models/todo_model.dart';
import 'package:todoapp/src/api/models/user.dart';
import 'package:todoapp/src/widgets/items.dart';
import 'package:todoapp/src/widgets/utils.dart';

class HomePage extends StatelessWidget {
  final User? user;
  const HomePage({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // mira una opcion es poner en chiquito el nombre del usuario en el appbar
        // si te animas seria algo como => Text(user!.name, Style: TextStyle())
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, right: 4, top: 6, bottom: 6),
          child: CircleAvatar(
            backgroundColor: Colors.deepOrange[200],
            radius: 12,
            child: Text(
              Utils.obtenerIniciales(user!.name).trim(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

        backgroundColor: Colors.teal,
        //centerTitle: true,
        title: Text(
          'Tareas de ' + user!.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Helvetica',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: user!.todoList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              padding: EdgeInsets.only(left: 16),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.edit_outlined, color: Colors.blue[50], size: 30),

                  SizedBox(width: 12),
                  Text(
                    'Modificar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[50],
                    ),
                  ),
                ],
              ),
            ),

            secondaryBackground: Container(
              padding: EdgeInsets.only(right: 16),
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.red[50],
                  size: 30,
                ),
              ),
            ),

            key: Key(user!.todoList[index].id.toString()),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                final result = await context.pushNamed(
                  'update_todo',
                  pathParameters: {'id': user!.todoList[index].id.toString()},
                  extra: user!.todoList[index],
                );
                // si te salis de update_todo con un mapa null te truena el programa
                //pero este result != null hace que la tarea tarde en volver a aparacere por el async await, porfa corregilo
                if (result != null) user!.updateTodo(result as Todo);
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
          //si alguien cancela esta operación volvienda hacia atras muere el programa
          //solucionado permitiendo que el mapa venga null
          //Falta validar que el mapa no venga vacío
          final result = await context.pushNamed('create_todo') as Map?;

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
