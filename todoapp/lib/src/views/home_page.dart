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
    if (user == null) {
      return const Scaffold(body: Center(child: Text('Usuario no disponible')));
    }

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
                await Future.delayed(const Duration(milliseconds: 250));

                final result = await context.pushNamed(
                  'update_todo',
                  pathParameters: {'id': user!.todoList[index].id.toString()},
                  extra: user!.todoList[index],
                );

                if (result != null) user!.updateTodo(result as Todo);
                return false;
              }

              if (direction == DismissDirection.endToStart) {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('¿Desea eliminar esta tarea?'),
                    content: const Text('Esta acción no se puede deshacer.'),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(true),
                        child: const Text(
                          'Confirmar',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.pop(false),
                        child: const Text('Cancelar'),
                      ),
                    ],
                  ),
                );

                if (confirm == true) {
                  user!.todoList.removeAt(index);
                  return true;
                }

                return false;
              }

              return false;
            },

            child: Item(todo: user!.todoList[index]),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final result = await context.pushNamed('create_todo');

          //Aqui hay un problema con el id ya que depende de la longitud y si se borra alguna tarea
          // el id se reasigna dando tareas con mismo id.
          // opciones: asignar el id con la fecha o milisegundos o directamente usando un paquete externo

          if (result != null && result is Map) {
            user!.addTodo(
              Todo(
                id: user!.todoList.length + 1,
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
