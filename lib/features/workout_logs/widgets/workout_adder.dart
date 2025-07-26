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
  List<(TextEditingController,TextEditingController, bool)> sets = [];

  @override
  void initState() {
    super.initState();
    _selectedWorkout = standardWorkouts.first;
    sets.add((TextEditingController(),TextEditingController(), false));
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
    return Center(child: Stack(
      children: [
         
        Positioned(right:0,top:0,child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.brush)),
                IconButton(onPressed: (){}, icon: Icon(Icons.lock)),
              ],
            ),
            SizedBox(),
            ElevatedButton(onPressed: (){setState(() {
              sets.add((TextEditingController(),TextEditingController(),false));
            });}, child: Text("Add Set")),
            (sets.length > 1 ?ElevatedButton(onPressed: (){setState(() {
              sets.removeLast();
            });}, child: Text("Remove Set")):SizedBox(width: 0,height:0,))
          ],
        )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                (_selectedWorkout == "Custom" ? StyledTextField(controller: customWorkoutController, hintText: "Enter Custom Workout", labelText: "Custom workout") : SizedBox()),
                for (int id = 0; id < sets.length; id++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StyledTextField(controller: sets[id].$1, hintText: "", labelText: "Reps${id + 1}",locked: sets[id].$3,keyboardType: TextInputType.numberWithOptions(),width:100),
                      StyledTextField(controller: sets[id].$2, hintText: "", labelText: "Weight${id + 1} (kg)", locked: sets[id].$3,keyboardType: TextInputType.numberWithOptions(),width:100),
                    ],
                ),
              ]
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
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
                  ElevatedButton(onPressed: (){for (int i = 0; i<sets.length; i++){debugPrint(sets[i].$1.text);}}, child: Center(
                    child: Text("Add Workout"),
                  )),
                ],
              ),
            )
          ],
        ),]
      ),);
  }

}
