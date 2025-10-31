import 'package:todoapp/src/api/models/todo_model.dart';
import 'package:todoapp/src/api/models/user.dart';

final amehd = User(
  name: 'Amehd',
  email: 'amehd.mendez@gmail.com',
  password: '20232030664',
  todoList: [
    Todo(
      id: 1,
      title: 'Agregar inicio de sesion',
      description:
          'Agregar inicio de sesion con el correo institucional y numero de cuenta de ambos',
      isCompleted: true,
    ),
    Todo(
      id: 2,
      title: 'Agregar crear cueta',
      description:
          'Agregar pantalla de creacion de cuenta con validacion de correo y contraseña',
      isCompleted: true,
    ),
    Todo(
      id: 3,
      title: 'Pruebas',
      description: 'Comprobar que funcione el crear, editar y borrar una tarea',
      isCompleted: false,
    ),
  ],
);

final roberto = User(
  name: 'Roberto',
  email: 'rcamaya@unah.hn',
  password: '20232030549',
);
