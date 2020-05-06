import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTask;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) => SingleChildScrollView(
              child: Container(
                color: Color(0xff757575),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 5,
                  right: 5,
                ),
                child: AddTaskScreen(
                  onChanged: (value) {
                    newTask = value;
                  },
                  onTap: () {
                    if (newTask != null &&
                        newTask.replaceAll(' ', '').length != 0) {
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(newTask.trim());
                      Navigator.pop(context);
                    } else
                      Alert(
                        context: context,
                        type: AlertType.info,
                        title: "Invalid Input",
                        desc: "Task can\'t be blank!",
                        style: AlertStyle(
                          isCloseButton: false,
                          alertBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(
                              color: Colors.lightBlueAccent[200],
                              width: 1.5,
                            ),
                          ),
                          backgroundColor: Colors.black,
                          titleStyle:
                              TextStyle(color: Colors.white, fontSize: 25),
                          descStyle:
                              TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        buttons: [
                          DialogButton(
                            color: Colors.lightBlueAccent,
                            child: Text(
                              "Re-Enter",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          )
                        ],
                      ).show();
                  },
                ),
              ),
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 45, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 36,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'TODOEY',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} tasks',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
