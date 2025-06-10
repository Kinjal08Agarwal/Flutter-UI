import 'package:flutter/material.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<_Task> _tasks = [
    _Task(title: 'Setup project'),
    _Task(title: 'Design wireframes'),
    _Task(title: 'Implement navigation'),
    _Task(title: 'Add state management'),
    _Task(title: 'Test UI components'),
  ];

  void _toggleTaskChecked(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List', style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return Card(
            child: ListTile(
              leading: Checkbox(
                value: task.isCompleted,
                onChanged: (_) => _toggleTaskChecked(index),
              ),
              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Task {
  String title;
  bool isCompleted;

  _Task({required this.title, this.isCompleted = false});
}