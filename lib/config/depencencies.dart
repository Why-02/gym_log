import 'package:gym_log/features/workout_logs/workout_logs_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
List<SingleChildWidget> homeProviders = [
  ChangeNotifierProvider<WorkoutLogsViewModel>(create:(context) => WorkoutLogsViewModel(),),
];

