import 'package:flutter/material.dart';

import '../bloc/exported_blocs.dart';
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
        onChanged: (_) {
          context.read<TaskBloc>().add(TapCheckboxTaskEvent(task: task));
        },
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
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
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
                TextButton(
                  onPressed: () {
                    context.read<TaskBloc>().add(DeleteTaskEvent(task: task));
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Sim',
                    style: context.appTextStyles.textSemiBold
                        .copyWith(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Não', style: context.appTextStyles.textBold),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
