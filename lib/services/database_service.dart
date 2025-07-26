abstract class DatabaseService {

  Future<Map<String,dynamic>> getWorkoutData();
  Future<void> createWorkoutData(dynamic data);
  Future<void> updateWorkoutData(int index, dynamic data);
  Future<Map<String,dynamic>> getFilteredWorkoutData(dynamic filter);
  Future<void> deleteWorkoutData(int index);
  Future<Map<String,dynamic>> getProfile();
  Future<void> createProfile(dynamic data);
  Future<void> updateProfile(int index, dynamic data);
} 

