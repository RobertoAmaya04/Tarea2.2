class Todo {
  String title;
  String description;
  bool isCompleted;
  int id;

  Todo({
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.id,
  });

  ToJson() {
    return {
      'title': this.title.toString(),
      'description': this.description.toString(),
      'isCompleted': this.isCompleted.toString(),
      'id': this.isCompleted.toString(),
    };
  }
}
