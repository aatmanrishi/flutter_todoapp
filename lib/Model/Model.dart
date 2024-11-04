class Todo {
  final String todoTask;
  late final bool? isChecked;
  final DateTime? createdTimeStamp;
  final DateTime? updatedTimeStamp;

  Todo({
    required this.todoTask,
    this.isChecked,
    this.createdTimeStamp,
    this.updatedTimeStamp,
  });

  // Factory constructor to create a Todo from JSON
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      todoTask: json["todoTask"] as String,
      isChecked: json["isChecked"] as bool?,
      createdTimeStamp: json["createdTimeStamp"] != null
          ? DateTime.parse(json["createdTimeStamp"] as String)
          : null,
      updatedTimeStamp: json["updatedTimeStamp"] != null
          ? DateTime.parse(json["updatedTimeStamp"] as String)
          : null,
    );
  }

  // Method to convert a Todo instance to JSON
  Map<String, dynamic> toJson() {
    return {
      "todoTask": todoTask,
      "isChecked": isChecked,
      "createdTimeStamp": createdTimeStamp?.toIso8601String(),
      "updatedTimeStamp": updatedTimeStamp?.toIso8601String(),
    };
  }
}
