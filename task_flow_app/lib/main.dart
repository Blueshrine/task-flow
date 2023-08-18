import 'package:flutter/material.dart';

import './ui/theme/theme_configuration.dart';
import './pages/task_page.dart';
import './bloc/exported_blocs.dart';
import 'models/task_model.dart';

void main() => runApp(const MyApp());

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc()
        ..add(
          const AddTaskEvent(
            task: TaskModel(title: 'Teste 1', description: 'Apenas testando.'),
          ),
        ),
      child: MaterialApp(
        title: 'Task Flow',
        theme: ThemeConfiguration.appTheme,
        home: const TaskPage(),
      ),
    );
  }
}
