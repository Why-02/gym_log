import 'package:flutter/material.dart';

class WorkoutLogsHeader extends StatefulWidget {
  const WorkoutLogsHeader({super.key});

  @override
  State<WorkoutLogsHeader> createState() => _WorkoutLogsHeaderState();
}

class _WorkoutLogsHeaderState extends State<WorkoutLogsHeader> {

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    
    return  AppBar(
        title: Center(
          child: Row(
            children: [
              ElevatedButton(
                style:ButtonStyle(elevation: WidgetStatePropertyAll(0)),
                onPressed: () async {
                  DateTime? date = await showDatePicker(
                    context: context, 
                    firstDate: DateTime(2000), 
                    lastDate: DateTime(2100),
                    currentDate: selectedDate,  
                  );
                  if (date != null)
                  {
                    setState(() {
                      selectedDate = date;
                      
                    },);
                  }
                }, child: Text("$selectedDate"))
            ],
          )
        ),
    );
    
  }
}