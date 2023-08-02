import 'package:flutter/material.dart';

class ArchivedScreen extends StatelessWidget {

  const ArchivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Archived Tasks Screen",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}