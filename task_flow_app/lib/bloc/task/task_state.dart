part of 'task_bloc.dart';

final class TaskState extends Equatable {
  final List<TaskModel> allTasks;

  const TaskState({required this.allTasks});

  Map<String, dynamic> toMap() {
    return {
      'all_tasks': allTasks.map((e) => e.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      allTasks: List<TaskModel>.from(
        map['all_tasks']?.map((t) => TaskModel.fromMap(t)),
      ),
    );
  }

  @override
  List<Object> get props => [allTasks];
}

final class InitialTaskState extends TaskState {
  const InitialTaskState() : super(allTasks: const <TaskModel>[]);
}

final class AddingTaskState extends TaskState {
  const AddingTaskState(List<TaskModel> tasks) : super(allTasks: tasks);
}

final class UpdatingTaskState extends TaskState {
  const UpdatingTaskState(List<TaskModel> tasks) : super(allTasks: tasks);
}

final class DeletingTaskState extends TaskState {
  const DeletingTaskState(List<TaskModel> tasks) : super(allTasks: tasks);
}

final class TapCheckboxTaskState extends TaskState {
  const TapCheckboxTaskState(List<TaskModel> tasks) : super(allTasks: tasks);
}
