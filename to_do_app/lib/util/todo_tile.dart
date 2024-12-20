import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?) ? onChanged;
  Function (BuildContext)? deleteFunciton;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunciton,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: 
          [
            SlidableAction(
              onPressed: deleteFunciton,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
              backgroundColor: Colors.red,)
          ]),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
            // Checkbox
            Checkbox(
              value: taskCompleted, 
              onChanged: onChanged,
              activeColor: Colors.black,
              ),
            // Task name
            Text(
              taskName,
              style: TextStyle(decoration: taskCompleted?  TextDecoration.lineThrough:TextDecoration.none ),
            ),
          ],
        ),
        ),
      )

    );
  }
}