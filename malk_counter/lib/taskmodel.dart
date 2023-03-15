class TaskModel{

String title;
String? subtitle;
bool isDone;

TaskModel({
  required this.title,
  this.subtitle,
  this.isDone=false,
});

}