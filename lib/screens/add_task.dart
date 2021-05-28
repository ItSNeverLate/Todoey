import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskTitle = '';
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
          color: Theme.of(context).primaryColorDark),
      height: 150,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black,
              ),
              onChanged: (value) {
                taskTitle = value;
              },
              decoration: InputDecoration(
                filled: true,
                hintText: "New task title",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).add(
                  Task(title: taskTitle),
                );
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
