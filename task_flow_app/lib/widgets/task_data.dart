import 'package:flutter/material.dart';

import '../bloc/exported_blocs.dart';
import '../models/task_model.dart';
import '../ui/styles/app_text_styles.dart';
import './task_confirm_delete_modal.dart';

final class TaskData extends StatelessWidget {
  final TaskModel task;

  const TaskData({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (_) {
          context.read<TaskBloc>().add(TapCheckboxTaskEvent(task: task));
        },
      ),
      title: Text(
        task.title,
        style: context.appTextStyles.textSemiBold.copyWith(
          decoration: task.isDone! ? TextDecoration.lineThrough : null,
          color: task.isDone! ? Colors.grey : Colors.black,
        ),
      ),
      subtitle: task.description != null
          ? Text(
              task.description!,
              style: context.appTextStyles.textRegular,
            )
          : null,
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => TaskConfirmDeleteModal(task: task),
        );
      },
    );
  }
}
