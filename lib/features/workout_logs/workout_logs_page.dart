import 'package:flutter/material.dart';
import 'package:git_log/features/workout_logs/widgets/workout_adder.dart';
import 'package:git_log/features/workout_logs/widgets/workout_logs_header.dart';

class WorkoutLogsPage extends StatefulWidget {
  const WorkoutLogsPage({super.key});

  @override
  State<WorkoutLogsPage> createState() => _WorkoutLogsPageState();
}

class _WorkoutLogsPageState extends State<WorkoutLogsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:WorkoutLogsHeader(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(insetPadding: EdgeInsets.symmetric(vertical: 200),content:WorkoutAdder());
        });
      },child:Icon(Icons.add)
      ),
    );
  }
}