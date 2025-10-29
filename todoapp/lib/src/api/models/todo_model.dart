class Todo {
  String title;
  String description;

  Todo({required this.title, required this.description});

  ToJson(Todo todo) {
    return {
      'title': todo.title.toString(),
      'description': todo.description.toString(),
    };
  }
}
