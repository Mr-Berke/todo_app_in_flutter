import 'package:flutter/material.dart';
import 'package:to_do/utils/dialog_box.dart';
import 'package:to_do/utils/toDoTile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<List<dynamic>> ToDoList = [
    ['Study Flutter', false],
    ['Do app', false],
  ];

  final _controller = TextEditingController();

  void newTask() {
    setState(() {
      ToDoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onsave: newTask,
          oncancel: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(
        title: const Text(
          'To Do List',
          style: TextStyle(fontSize: 30, color: Colors.black54),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade600,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueGrey.shade200,
      ),
      body: ListView.builder(
        itemCount: ToDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: ToDoList[index][0].toString(),
            taskCompleted: ToDoList[index][1] as bool,
            onChanged: (value) {
              setState(() {
                ToDoList[index][1] = value ?? false;
              });
            },
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
