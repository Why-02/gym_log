import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

final String imagePath = "assets/default_profile_picture.jpg";

List<String> heightList = <String>['cm', 'ft'];
List<String> weightList = <String>['kg', 'lb'];
List<String> genderList = <String>['Male', 'Female'];

String nameText = "Snowi";
String birthdayText = "13/3/2024";
String ageText = "Age";
String heightText = "10";
String heightUnitText = "cm";
String weightText = "4.4";
String targetWeightText = "4.6";
String weightUnitText = "kg";
String genderText = "Male";

final double nameFont = 26;
double width = 412;
double height = 915;
Color backgroundColor = Colors.black;
Color textColor = Colors.white;
final double textFont = 20;
final String editIcon = "assets/icons/editicon.png";
final String birthdayIcon = "assets/icons/birthday_icon.png";
final String ageIcon = "assets/icons/age_icon.png";
final String heightIcon = "assets/icons/height_icon.png";
final String weightIcon = "assets/icons/weight_icon.png";
final String targetWeightIcon = "assets/icons/target_weight_icon.png";
final String maleIcon = "assets/icons/male_icon.png";
final String femaleIcon = "assets/icons/female_icon.png";

String genderIcon = femaleIcon;

double spacing = 10.0;
DateTime parseData=DateTime.now();

int cameraIndex = 0;
List<CameraDescription> cameras = [];
CameraController? cameraController;
