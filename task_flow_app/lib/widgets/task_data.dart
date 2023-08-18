import 'package:flutter/material.dart';

import '../models/task_model.dart';
import '../ui/styles/app_text_styles.dart';

final class TaskData extends StatelessWidget {
  final TaskModel task;

  const TaskData({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (value) {},
      ),
      title: Text(
        task.title,
        style: context.appTextStyles.textSemiBold,
      ),
      subtitle: task.description != null
          ? Text(
              task.description!,
              style: context.appTextStyles.textRegular,
            )
          : null,
    );
  }
}
