import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

final class TaskModel extends Equatable {
  final String uuid;
  final String title;
  final String? description;
  final bool? isDone;
  final bool? isDeleted;

  TaskModel({
    required this.title,
    String? uuid,
    this.description,
    this.isDone = false,
    this.isDeleted = false,
  }) : uuid = uuid ?? const Uuid().v4();

  TaskModel copyWith({
    String? uuid,
    String? title,
    String? description,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskModel(
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'title': title,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      uuid: map['uuid'],
      title: map['title'] ?? '',
      description: map['description'],
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props => [uuid, title, description, isDone, isDeleted];
}
