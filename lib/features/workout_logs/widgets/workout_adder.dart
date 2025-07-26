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
  bool locked = false;
  bool show = true;
  List<(TextEditingController,TextEditingController)> sets = [];

  @override
  void initState() {
    super.initState();
    _selectedWorkout = standardWorkouts.first;
    sets.add((TextEditingController(),TextEditingController()));
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
    if (show) {
      return Center(child: Stack(
      children: [
        Positioned(right:0,top:0,child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){setState(() {
                  locked = !locked;
                  }); }, 
                  icon: Icon((locked ? Icons.lock : Icons.lock_open)),
                  style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),  
                ),
                IconButton(onPressed: (){setState(() {
                  show  = false;
                  }); }, 
                  icon: Icon(Icons.delete),
                  style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),  
                ),
                
              ],
            ),
            
            ElevatedButton(onPressed: (){setState(() {
              sets.add((TextEditingController(),TextEditingController()));
            });}, child: Text("Add Set")),
            (sets.length > 1 ? ElevatedButton(onPressed: (){setState(() {
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
                (_selectedWorkout == "Custom" ? StyledTextField(controller: customWorkoutController, hintText: "", labelText: "Custom workout",readOnly: locked,) : SizedBox()),
                for (int id = 0; id < sets.length; id++)
                Row(
                    children: [
                      StyledTextField(controller: sets[id].$1, hintText: "", labelText: "Reps${id + 1}",keyboardType: TextInputType.numberWithOptions(),width:100,readOnly: locked,),
                      SizedBox(width:8),
                      StyledTextField(controller: sets[id].$2, hintText: "", labelText: "Weight${id + 1} (kg)",keyboardType: TextInputType.numberWithOptions(),width:100,readOnly: locked,),
                    ],
                ),
              ]
            ),
            DropdownButton(value: _selectedWorkout,items: standardWorkouts.map<DropdownMenuItem<String>>((String workout){
                          return DropdownMenuItem(
            value: workout,
            child: Text(workout));
                          }).toList(), 
                          onChanged: ((customWorkoutText == ""  && !locked) ? (String? newWorlout){
            setState(() {
              _selectedWorkout = newWorlout;
            });
                        } : null)),
            ElevatedButton(onPressed: (){for (int i = 0; i<sets.length; i++){debugPrint(sets[i].$1.text);}}, child: Center(
              child: Text("Add Workout"),
            ))
          ],
        ), ]
      ),);
    }
    return Center();
  }

}
