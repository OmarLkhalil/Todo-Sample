import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../modules/archievedtasks/archived_tasks_screen.dart';
import '../modules/donetasks/done_tasks_scren.dart';
import '../modules/newtasks/new_tasks_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  late Database database;

  List<Widget> screens = [
    const NewTasksScreen(),
    const DoneTasksScreen(),
    const ArchivedScreen(),
  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  @override
  Widget build(BuildContext context) {
    createDatabase();
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          insertToDatabase();
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "Done"),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: "Archived"),
        ],
      ),
    );
  }

  Future<String> getName() async {
    try {
      String name = "Omar Mohamed";
      await Future.delayed(const Duration(seconds: 5));
      print("Name: $name");
      return name;
    } catch (e) {
      print("Error: $e");
    }
    return "";
  }

  void createDatabase() async {
    database = await openDatabase(
      'todo.db',
      onCreate: (
        database,
        version,
      ) {
        print("Database Created");
        database
            .execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)',
        )
            .then((value) {
          print("Table Created");
        }).catchError((error) {
          print("Error: $error");
        });
      },
      version: 1,
      onOpen: (database) {
        print("Database Opened");
      },
    );
  }

  void insertToDatabase() {
    database.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO tasks (title, date, time, status) VALUES ("first task", "12/12/2021", "10:00 AM", "new")')
          .then((value) {
        print("$value inserted successfully");
      }).catchError((error) {
        print("Error: $error");
      });
      return Future(() => null);
    });
  }

  void updateDatabase() {

  }

  void deleteFromDatabase() {}
}
