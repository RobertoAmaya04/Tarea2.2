import 'package:todoapp/src/api/models/todo_model.dart';
import 'package:todoapp/src/api/models/user.dart';

class UserManager {
  final List<User> users = [];

  void addUser({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) {
    users.add(
      User(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
      ),
    );
  }

  User? loginUser({required String email, required String password}) {
    for (var user in users) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }
    return null;
  }

  void initBaseUsers() {
    this.addUser(
      name: 'Amehd',
      email: 'amehd.mendez@unah.hn',
      password: '20232030664',
      phoneNumber: '33218980',
    );
    this.addUser(
      name: 'Roberto',
      email: 'rcamaya@unah.hn',
      password: '20232030549',
      phoneNumber: '27332898',
    );

    this.users[0].addTodo(
      Todo(
        id: 1,
        title: 'Agregar inicio de sesion',
        description:
            'Agregar inicio de sesion con el correo institucional y numero de cuenta de ambos',
        isCompleted: true,
      )
    );
    this.users[0].addTodo(
      Todo(
        id: 2,
        title: 'Agregar crear cueta',
        description:
            'Agregar pantalla de creacion de cuenta con validacion de correo y contraseña',
        isCompleted: true,
      )
    );
    this.users[0].addTodo(
      Todo(
        id: 3,
        title: 'Pruebas',
        description: 'Comprobar que funcione el crear, editar y borrar una tarea',
        isCompleted: false,
      )
    );
  }
}
