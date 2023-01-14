class Todo {
  int? id;
  final String title;
  DateTime creationdate;
  bool ischecked;

  Todo({
    this.id,
    required this.title,
    required this.creationdate,
    required this.ischecked,
  });

   Map<String, dynamic> tomap() {
    return {
      'id': id,
      'title': title,
      'creationdate': creationdate.toString(),
      'ischecked': ischecked? 1:0,
    };
  }
}
