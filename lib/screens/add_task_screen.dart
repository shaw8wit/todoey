import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({this.onChanged, this.onTap});
  final onChanged;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 35),
          ),
          SizedBox(height: 30),
          TextField(
            onChanged: onChanged,
            autofocus: true,
            textAlign: TextAlign.center,
            cursorColor: Colors.lightBlueAccent,
            style: TextStyle(color: Colors.lightBlueAccent),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent),
              ),
            ),
          ),
          SizedBox(height: 30),
          ButtonTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.lightBlueAccent, width: 2),
            ),
            height: 50,
            child: FlatButton(
              onPressed: onTap,
              color: Colors.white,
              child: Text(
                'Create',
                style: TextStyle(fontSize: 15, color: Colors.lightBlueAccent),
              ),
            ),
          )
        ],
      ),
    );
  }
}
