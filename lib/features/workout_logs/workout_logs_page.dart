import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gym_log/features/workout_logs/widgets/workout_adder.dart';
import 'package:gym_log/features/workout_logs/widgets/workout_card.dart';
import 'package:gym_log/features/workout_logs/widgets/workout_logs_header.dart';
import 'package:gym_log/services/database_service.dart';

class WorkoutLogsPage extends StatefulWidget {
  const WorkoutLogsPage({super.key});

  @override
  State<WorkoutLogsPage> createState() => _WorkoutLogsPageState();
}

class _WorkoutLogsPageState extends State<WorkoutLogsPage> {
  
  final ScrollController scrollController = ScrollController();

  final DatabaseService _databaseService = DatabaseService.instance;
  
  List<Widget> workouts = [ ];

  void scrollUp(){
    scrollController.jumpTo(scrollController.position.maxScrollExtent , );
  }
  
  List<Map<String, dynamic>> logs = [];
    Future<List<Map<String, dynamic>>> fetchLogs() async {
      final values = await _databaseService.getWorkouts();
      setState(() {
        for (Map<String,dynamic> value in values) {
          setState(() {
            logs.add(value);
          });
          
        }
      });
      return values;
    }
    
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    fetchLogs();
    super.initState();
    // scrollUp();
    
  }

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
            constraints: BoxConstraints(maxWidth:WIDTH,maxHeight:0.5*HEIGHT  - keyboardOffset),
            child: ListView.builder(
              dragStartBehavior: DragStartBehavior.down,
              controller: scrollController,
              reverse: true,
              padding: EdgeInsets.all(10),
              itemCount: workouts.length + logs.length,
              itemBuilder: (context, index){
                if (index < logs.length ) {
                  return WorkoutCard(data: logs[index]);
                  }
              return workouts[workouts.length - index - 1 + logs.length];
            }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        
        setState(() {
          workouts.insert(0,WorkoutAdder());
        });
        // scrollUp();
        
      },child:Icon(Icons.add)
      ),
    );
  }
}