import 'package:flutter/material.dart';

import '../ui/styles/app_text_styles.dart';
import '../widgets/task_data.dart';
import '../bloc/exported_blocs.dart';
import '../widgets/task_form_modal.dart';

final class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const TaskFormModal(),
        ),
      ),
    );
  }

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
            onPressed: () => _addTask(context),
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
        onPressed: () => _addTask(context),
        child: const Icon(Icons.post_add),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  final tasks = state.allTasks;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (_, index) => TaskData(task: tasks[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
