import 'package:flutter/material.dart';
import 'package:gym_log/features/workout_logs/workout_logs_view_model.dart';
import 'package:provider/provider.dart';

class WorkoutLogsHeader extends StatelessWidget {
  const WorkoutLogsHeader({super.key});

  

  @override
  Widget build(BuildContext context) {
    final WorkoutLogsViewModel viewModel = context.watch<WorkoutLogsViewModel>();
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
                    currentDate: viewModel.convertStringToDate(viewModel.date),  
                  );
                  if (date != null) {
                    viewModel.setDate(viewModel.convertDateToString(date));
                    viewModel.setLogsPerDate(date: viewModel.date);
                  }
                  
                }, child: Text(viewModel.date))
            ],
          )
        ),
    );
    
  }
}