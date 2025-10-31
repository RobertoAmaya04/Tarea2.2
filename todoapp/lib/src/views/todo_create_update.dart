import 'package:flutter/material.dart';
import 'package:todoapp/src/api/models/todo_model.dart';
import 'package:todoapp/src/widgets/custom_text_input.dart';
import 'package:go_router/go_router.dart';

class TodoCreateUpdate extends StatelessWidget {
  final Todo? todo;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  TodoCreateUpdate({super.key, this.todo});

  @override
  Widget build(BuildContext context) {
    if (todo != null) {
      titleController.text = todo!.title;
      descriptionController.text = todo!.description;
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal),
      body: SizedBox(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              CustomTextInput(
                type: CustomTextInputType.title,
                cont: titleController,
              ),
              SizedBox(height: 16),
              CustomTextInput(
                type: CustomTextInputType.description,
                cont: descriptionController,
              ),

              //voy a eliminar todo este column
            ],
          ),
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterDecoration: BoxDecoration(color: Colors.teal[300]),
      persistentFooterButtons: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: TextStyle(
                fontSize: 18,
                fontFamily: "Arial",
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              if (todo != null) {
                todo!.title = titleController.text;
                todo!.description = descriptionController.text;
                context.pop(todo);
              } else {
                context.pop(
                  {
                        'title': titleController.text,
                        'description': descriptionController.text,
                      }
                      as Map,
                );
              }
            },
            child: todo != null ? Text('Guardar') : Text('Crear'),
          ),
        ),
      ],
    );
  }
}
