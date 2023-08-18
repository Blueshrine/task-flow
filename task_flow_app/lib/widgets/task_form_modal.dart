import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../bloc/exported_blocs.dart';
import '../models/task_model.dart';

class TaskFormModal extends StatefulWidget {
  const TaskFormModal({super.key});

  @override
  State<TaskFormModal> createState() => _TaskFormModalState();
}

class _TaskFormModalState extends State<TaskFormModal> {
  final formKey = GlobalKey<FormState>();
  final titleEC = TextEditingController();

  @override
  void dispose() {
    titleEC.dispose();
    super.dispose();
  }

  void _handleEditingComplete() {
    if (titleEC.text.isNotEmpty) {
      final task = TaskModel(title: titleEC.text);
      context.read<TaskBloc>().add(AddTaskEvent(task: task));
      titleEC.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          TextFormField(
            style: const TextStyle(color: Colors.white),
            autofocus: true,
            controller: titleEC,
            validator: Validatorless.required('Preencha o Título.'),
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.white, fontSize: 14),
              prefixIconColor: Colors.white,
              prefixIcon: const Icon(Icons.task_alt, size: 22),
              suffixIconColor: Colors.white,
              suffixIcon: IconButton(
                onPressed: _handleEditingComplete,
                icon: const Icon(Icons.arrow_circle_up, size: 22),
              ),
              hintText: 'Nova tarefa',
              border: InputBorder.none,
            ),
            onEditingComplete: _handleEditingComplete,
          ),
        ],
      ),
    );
  }
}
