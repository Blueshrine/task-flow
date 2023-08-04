import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

final class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const InitialTaskState()) {
    on<AddTaskEvent>(_onAddTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
  }

  void _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) {
    emit(AddingTaskState(List.from(state.allTasks)..add(event.task)));
  }

  void _onUpdateTask(UpdateTaskEvent event, Emitter<TaskState> emit) {}
  void _onDeleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) {}
}
