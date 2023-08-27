import 'package:flutter/material.dart';

import '../bloc/exported_blocs.dart';
import '../models/task_model.dart';
import '../ui/styles/app_text_styles.dart';
import '../components/custom_text_button.dart';

class TaskConfirmDeleteModal extends StatelessWidget {
  final TaskModel task;

  const TaskConfirmDeleteModal({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      title: RichText(
        text: TextSpan(
          style: context.appTextStyles.textRegular.copyWith(
            color: Colors.black,
            fontSize: 18,
          ),
          children: <InlineSpan>[
            const TextSpan(text: 'Deseja excluir: '),
            TextSpan(
              text: task.title,
              style: context.appTextStyles.textExtraBold,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        CustomTextButton(
          content: 'Sim',
          onPressed: () {
            context.read<TaskBloc>().add(DeleteTaskEvent(task: task));
            Navigator.pop(context);
          },
          foregroundColor: Colors.red,
        ),
        const SizedBox(height: 10),
        CustomTextButton(
          content: 'Não',
          onPressed: () => Navigator.pop(context),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
      ],
    );
  }
}
