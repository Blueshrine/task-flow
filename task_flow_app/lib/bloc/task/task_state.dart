part of 'task_bloc.dart';

final class TaskState extends Equatable {
  final List<TaskModel> allTasks;

  const TaskState({required this.allTasks});

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
