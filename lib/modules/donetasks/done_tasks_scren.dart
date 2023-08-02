import 'package:flutter/material.dart';

class DoneTasksScreen extends StatelessWidget {

  const DoneTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Done Tasks Screen",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}