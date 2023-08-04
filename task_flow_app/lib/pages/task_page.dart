import 'package:flutter/material.dart';

import '../models/task_model.dart';
import '../ui/styles/app_text_styles.dart';
import '../widgets/task_data.dart';

final class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  final List<TaskModel> allTasks = const [
    TaskModel(title: 'Task 1', description: 'Description 1'),
    TaskModel(title: 'Task 2', description: 'Description 2'),
    TaskModel(title: 'Task 3', description: 'Description 3'),
    TaskModel(title: 'Task 4', description: 'Description 4'),
    TaskModel(title: 'Task 5', description: 'Description 5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: Text(
          'Task Flow',
          style: context.appTextStyles.textTitle.copyWith(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add new task.',
        onPressed: () {},
        child: const Icon(Icons.post_add),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: allTasks.length,
                itemBuilder: (_, index) {
                  return TaskData(task: allTasks[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
