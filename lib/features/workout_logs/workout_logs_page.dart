import 'package:flutter/material.dart';
import 'package:gym_log/features/workout_logs/widgets/workout_adder.dart';
import 'package:gym_log/features/workout_logs/widgets/workout_logs_header.dart';

class WorkoutLogsPage extends StatefulWidget {
  const WorkoutLogsPage({super.key});

  @override
  State<WorkoutLogsPage> createState() => _WorkoutLogsPageState();
}

class _WorkoutLogsPageState extends State<WorkoutLogsPage> {

  List<WorkoutAdder> workouts = [];
  
  @override
  Widget build(BuildContext context) {
    final WIDTH = MediaQuery.of(context).size.width;
    final HEIGHT = MediaQuery.of(context).size.height;
    final keyboardOffset = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      
      body:Column(
        children: [
          WorkoutLogsHeader(),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth:WIDTH,maxHeight:HEIGHT - 120 - keyboardOffset),
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: workouts.length,
              itemBuilder: (context, index){
              return workouts[workouts.length - index - 1];
            }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          workouts.insert(0,WorkoutAdder());
        });
        
        
      },child:Icon(Icons.add)
      ),
    );
  }
}