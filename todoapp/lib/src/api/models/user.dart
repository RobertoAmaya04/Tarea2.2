import 'package:todoapp/src/api/models/todo_model.dart';

//tengo un erro aquí porque no acepta la creación de tareas con mis credenciales
//El error salta en la linea 10 void addTodoo(Todo todo)

class User {
  final String name;
  final String email;
  final String password;
  final List<Todo> todoList;

  User({
    required this.name,
    required this.email,
    required this.password,
    this.todoList = const [],
  });

  void addTodo(Todo todo) {
    todoList.add(todo);
  }

  void removeTodo(Todo todo) {
    todoList.remove(todo);
  }

  // variante dependiendo de como te sea mas comodo en la vaina esa para deslizar
  //
  //void removeTodo(int index) {
  //   todoList.remove(todoList[index]);
  // }
  //
  // tambien puedes borrar directo alla con el user!.todoList.removeAt(index)

  List<Todo> getTodos() {
    return todoList;
  }

  void updateTodo(Todo todo) {
    final index = todoList.indexWhere((element) => element.id == todo.id);
    if (index == -1) return;
    todoList[index] = todo;
  }
}
