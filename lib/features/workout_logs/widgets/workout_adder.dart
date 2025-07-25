import 'package:flutter/material.dart';
import 'package:git_log/features/core/ui/widgets/styled_text_field.dart';
import 'package:git_log/features/workout_logs/widgets/utils.dart';

class WorkoutAdder extends StatefulWidget {
  const WorkoutAdder({super.key});

  @override
  State<WorkoutAdder> createState() => _WorkoutAdderState();
}

class _WorkoutAdderState extends State<WorkoutAdder> {
  String? _selectedWorkout;
  TextEditingController customWorkoutController = TextEditingController();
  String customWorkoutText = "";

  @override
  void initState() {
    super.initState();
    _selectedWorkout = standardWorkouts.first;
    customWorkoutController.addListener((){
      setState(() {
        customWorkoutText = customWorkoutController.text;
      });
      
    });
  }
  @override
  void dispose() {
    customWorkoutController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text("New Workout"),
        DropdownButton(value: _selectedWorkout,items: standardWorkouts.map<DropdownMenuItem<String>>((String workout){
          return DropdownMenuItem(
            value: workout,
            child: Text(workout));
          }).toList(), 
          onChanged: (customWorkoutText == "" ? (String? newWorlout){
            setState(() {
              _selectedWorkout = newWorlout;
            });
        } : null)),
        Text(customWorkoutText),
        StyledTextField(controller: customWorkoutController, hintText: "Enter Custom Workout", labelText: "Custom workout"),
        ElevatedButton(onPressed: (){}, child: Center(
          child: Text("Add Workout"),
        ))
      ],
    ),);
  }

}
