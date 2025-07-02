class Todo {
  final String id;
  final String title;
  final bool completed;
  final DateTime createdAt;
  final String? feeling;

  Todo({
    required this.id,
    required this.title,
    this.completed = false,
    required this.createdAt,
    this.feeling,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        completed: json['completed'],
        createdAt: DateTime.parse(json['createdAt']),
        feeling: json['feeling'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'completed': completed,
        'createdAt': createdAt.toIso8601String(),
        'feeling': feeling,
      };

  Todo copyWith({
    String? id,
    String? title,
    bool? completed,
    DateTime? createdAt,
    String? feeling,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
      feeling: feeling ?? this.feeling,
    );
  }
}
