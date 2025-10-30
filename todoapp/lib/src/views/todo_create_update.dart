import 'package:flutter/material.dart';
import 'package:todoapp/src/api/models/todo_model.dart';
import 'package:todoapp/src/widgets/custom_text_input.dart';

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
      body: Padding(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: todo != null ? Text('Crear') : Text('Guardar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
