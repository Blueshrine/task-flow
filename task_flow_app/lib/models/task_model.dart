final class TaskModel {
  final String title;
  final String? description;
  final bool? isDone;
  final bool? isDeleted;

  const TaskModel({
    required this.title,
    this.description,
    this.isDone = false,
    this.isDeleted = false,
  });

  TaskModel copyWith({
    String? title,
    String? description,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] ?? '',
      description: map['description'],
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }
}
