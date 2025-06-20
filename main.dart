import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'task_list_screen.dart';
import 'dashboard_screen.dart';
import 'skill_tracker_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intern App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/tasks': (context) => TaskListScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/skills': (context) => SkillTrackerScreen(),
      },
    );
  }
}