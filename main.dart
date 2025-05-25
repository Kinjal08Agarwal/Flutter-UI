import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do UI',
      debugShowCheckedModeBanner: false,
      home: const ToDoScreen(),
    );
  }
}

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  final List<Map<String, dynamic>> tasks = const [
    {"title": "Buy groceries", "isDone": false},
    {"title": "Walk the dog", "isDone": true},
    {"title": "Read a book", "isDone": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('My Tasks'),
        actions: const [Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: Icon(Icons.check_circle_outline),
        )],
        backgroundColor: Colors.deepPurple,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: tasks.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    task["isDone"]
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: task["isDone"] ? Colors.green : Colors.grey,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    task["title"],
                    style: TextStyle(
                      fontSize: 16,
                      decoration: task["isDone"]
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: task["isDone"] ? Colors.grey : Colors.black87,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
