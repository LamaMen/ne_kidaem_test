class Task {
  final int id;
  final String title;
  final TaskCategory category;

  Task({required this.id, required this.title, required this.category});

  bool checkCategory(TaskCategory category) => this.category == category;
}

enum TaskCategory { OnHold, InProgress, NeedsReview, Approved }
