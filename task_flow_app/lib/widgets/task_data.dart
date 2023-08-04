import 'package:flutter/material.dart';

import '../models/task_model.dart';

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
      title: Text(task.title),
      subtitle: Text(task.description),
    );
  }
}
