import 'package:todoapp/src/api/models/todo_model.dart';

//tengo un erro aquí porque no acepta la creación de tareas con mis credenciales
//El error salta en la linea 10 void addTodoo(Todo todo)

class User {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final List<Todo> todoList = [];

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  void addTodo(Todo todo) {
    todoList.add(todo);
  }

  void removeTodo(Todo todo) {
    todoList.remove(todo);
    
  }

  List<Todo> getTodos() {
    return todoList;
  }

  void updateTodo(Todo todo) {
    final index = todoList.indexWhere((element) => element.id == todo.id);
    if (index == -1) return;
    todoList[index] = todo;
  }

  void updateTodoIDs(){
    for(var todo in todoList){
      todo.id = todoList.indexOf(todo) + 1;
    }
  }
}
