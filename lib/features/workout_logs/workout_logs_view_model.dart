// state managment
// state modeling
// ui logic
// inject repository
// handling errors inherited from repo/service

import 'package:flutter/material.dart';
import 'package:gym_log/services/database_service.dart';

class WorkoutLogsViewModel extends ChangeNotifier{
  // inject repository
  final DatabaseService _databaseService = DatabaseService.instance;
  WorkoutLogsViewModel();

  // state modeling
  bool _isLoading = false;
  String? _error;
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  // state managment
  String _date = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
  String get date => _date;
  void setDate(String date){
    _date = date;
    notifyListeners();
  }

  String convertDateToString (DateTime date){
    return "${date.day}/${date.month}/${date.year}";
  }
  DateTime convertStringToDate (String date){
    List<String> parts = date.split("/");
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);
    return DateTime(year, month, day);
  }

  List<Map<String,dynamic>> _logs = [];
  
  // ui logic
  Future<void> setLogsPerDate() async {
    _error = null;
    _isLoading = true;
    notifyListeners();
    // error handling
    try{
      _logs = [];
      final values = await _databaseService.getWorkoutsperDate(date: _date);
      _logs = values;
      // for (Map<String,dynamic> value in values) {
      //       _logs.add(value);
            
      //   }
        notifyListeners();
        

    }
    catch(e){
      _error = e.toString();
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }
  List<Map<String,dynamic>> get logs => _logs;
}