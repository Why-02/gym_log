import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String imagePath = "";

  List<String> heightList = <String>['cm', 'ft'];
  List<String> weightList = <String>['kg', 'lb'];

  String nameText = "Snowi";
  String birthdayText = "13/3/2024";
  String ageText = "Age";
  String heightText = "10";
  String heightUnitText = "cm";
  String weightText = "4.4";
  String targetWeightText = "4.6";
  String weightUnitText = "kg";

  final double nameFont = 26;
  final double width = 412;
  final double height = 915;
  final Color backgroundColor = Colors.white;
  final Color textColor = Colors.black;
  final double textFont = 20;
  final String editIcon = "icons/edit_icon.png";
  final String birthdayIcon = "icons/birthday_icon.png";
  final String ageIcon = "icons/age_icon.png";
  final String heightIcon = "icons/height_icon.png";
  final String weightIcon = "icons/weight_icon.png";
  final String targetWeightIcon = "icons/target_weight_icon.png";
  final double spacing = 10.0;
  
  String age(DateTime today, DateTime birthdayDate) {
    final year = today.year - birthdayDate.year;
    final mth = today.month - birthdayDate.month;
    final days = today.day - birthdayDate.day;
    if (mth < 0) {
      return "${year - 1}";
    } else {
      if (days < 0) {
        return "${year - 1}";
      } else {
        return "$year";
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    DateTime parseData = DateFormat("dd/MM/yyyy").parse(birthdayText);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(width/8),
          )
        ),
        backgroundColor: backgroundColor,
        toolbarHeight: height / 6,
        elevation: 20.0,
        shadowColor: textColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            foregroundImage: imagePath != ""
                ? FileImage(File(imagePath))
                : NetworkImage(
                    "https://ziggyfamily.com/cdn/shop/articles/chats-blancs-3_520x500_29f247a5-0663-457d-9d84-2152894d15b9.jpg?v=1748334872",
                  ),
          ),
        ),
        leadingWidth: width / 3,
        title: Text(
          nameText,
          style: TextStyle(color: textColor, fontSize: nameFont),
        ),
        actions: [handleEditButton(context)],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: spacing,
          children: [
            Column(
              children: [
                IconInfo(iconAsset: birthdayIcon, textColor: textColor),
                SizedBox(height: spacing),
                IconInfo(iconAsset: ageIcon, textColor: textColor),
                SizedBox(height: spacing),
                IconInfo(iconAsset: heightIcon, textColor: textColor),
                SizedBox(height: spacing),
                IconInfo(iconAsset: weightIcon, textColor: textColor),
                SizedBox(height: spacing),
                IconInfo(iconAsset: targetWeightIcon, textColor: textColor),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInfo(
                  textColor: textColor,
                  text:
                      birthdayText,
                  textFont: textFont,
                ),
                SizedBox(height: spacing),
                TextInfo(
                  textColor: textColor,
                  text: age(DateTime.now(), parseData),
                  textFont: textFont,
                ),
                SizedBox(height: spacing),
                TextInfo(
                  textColor: textColor,
                  text: "$heightText $heightUnitText",
                  textFont: textFont,
                ),
                SizedBox(height: spacing),
                TextInfo(
                  textColor: textColor,
                  text: "$weightText $weightUnitText",
                  textFont: textFont,
                ),
                SizedBox(height: spacing),
                TextInfo(
                  textColor: textColor,
                  text: "$targetWeightText $weightUnitText",
                  textFont: textFont,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextButton handleEditButton(BuildContext context) {
    return TextButton(
      onPressed: handleEditButtonPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1),
        child: Image.asset(
          editIcon,
          width: 66 / 1.5,
          height: 40 / 1.5,
          fit: BoxFit.fill,
          color: textColor,
        ),
      ),
    );
  }

  void handleEditButtonPressed() async {
    TextEditingController userNameController = TextEditingController(text: nameText,);
    TextEditingController birthdayController = TextEditingController(text: birthdayText,);
    TextEditingController heightController = TextEditingController(text: heightText,);
    TextEditingController weightController = TextEditingController(text: weightText,);
    TextEditingController targetWeightController = TextEditingController(text: targetWeightText,);
    TextEditingController heightUnitController = TextEditingController(text: heightUnitText,);
    TextEditingController weightUnitController = TextEditingController(text: weightUnitText,);


    final Map<String, dynamic>? extractedData = await showDialog(
      context: context,
      builder: (BuildContext context)  => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) =>  AlertDialog(
          backgroundColor: backgroundColor,
          insetPadding: EdgeInsets.symmetric(vertical: 100),
          content: Center(
            child: Padding(
              padding: EdgeInsetsGeometry.directional(top: 20.0),
              child: Column(
                children: [
                  Text(
                    "Modify your profile information",
                    style: TextStyle(fontSize: textFont, color: textColor),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Username",
                      style: TextStyle(
                        fontSize: textFont - 8,
                        height: (textFont - 8) / textFont,
                      ),
                    ),
                  ),
                  TextField(
                    style: TextStyle(fontSize: textFont - 4),
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: "Update your username",
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Birthday",
                      style: TextStyle(
                        fontSize: textFont - 8,
                        height: (textFont - 8) / textFont,
                      ),
                    ),
                  ),
                  TextField(
                    readOnly: true,
                    enableInteractiveSelection: false,
                    controller: birthdayController,
                    style: TextStyle(fontSize: textFont - 4),
                    onTap: () async {
                      DateTime parseData = DateFormat("dd/MM/yyyy").parse(birthdayController.text);
                      DateTime? date = await showDatePicker(
                        locale: const Locale('en', 'GB'),
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2030),
                        currentDate: parseData,
                      );
                      if (date != null) {
                        setState(() {
                          birthdayController.text = "${date.day}/${date.month}/${date.year}";
                        });
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Height",
                      style: TextStyle(
                        fontSize: textFont - 8,
                        height: (textFont - 8) / textFont,
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[\d\.]')),
                          SinglePeriodEnforcer(),
                        ],
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: heightController,
                        decoration: InputDecoration(
                          hintText: "Update your height",
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DropdownButtonFormField(
                          value: heightUnitController.text,
                          items: heightList.map<DropdownMenuItem<String>>((
                            String unit,
                          ) {
                            return DropdownMenuItem<String>(
                              value: unit,
                              child: Text(unit),
                            );
                          }).toList(),
                          onChanged: (String? newUnit) {
                            setState(() {
                              heightUnitController.text = newUnit!;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            constraints: BoxConstraints(
                              minWidth: 50,
                              maxWidth: 50,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Weight",
                      style: TextStyle(
                        fontSize: textFont - 8,
                        height: (textFont - 8) / textFont,
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[\d\.]')),
                          SinglePeriodEnforcer(),
                        ],
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: weightController,
                        decoration: InputDecoration(
                          hintText: "Update your weight",
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DropdownButtonFormField(
                          value: weightUnitController.text,
                          items: weightList.map<DropdownMenuItem<String>>((
                            String unit,
                          ) {
                            return DropdownMenuItem<String>(
                              value: unit,
                              child: Text(unit),
                            );
                          }).toList(),
                          onChanged: (String? newUnit) {
                            setState(() {
                              weightUnitController.text = newUnit!;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            constraints: BoxConstraints(
                              minWidth: 50,
                              maxWidth: 50,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Target Weight",
                      style: TextStyle(
                        fontSize: textFont - 8,
                        height: (textFont - 8) / textFont,
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[\d\.]')),
                          SinglePeriodEnforcer(),
                        ],
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: targetWeightController,
                        decoration: InputDecoration(
                          hintText: "Update your target weight",
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DropdownButtonFormField(
                          value: weightUnitController.text,
                          items: weightList.map<DropdownMenuItem<String>>((
                            String unit,
                          ) {
                            return DropdownMenuItem<String>(
                              value: unit,
                              child: Text(unit),
                            );
                          }).toList(),
                          onChanged: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            constraints: BoxConstraints(
                              minWidth: 50,
                              maxWidth: 50,
                            ),
                          ),
                        ),
                      )
                    ]
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Close",
                          style: TextStyle(
                            fontSize: textFont,
                          ),
                        ),
                      ),
                      SizedBox(width: 50,),
                      ElevatedButton(
                        onPressed: () {
                          Map<String, String> extractedData = {"username" : userNameController.text, "birthday" : birthdayController.text, "height" : heightController.text, "heightUnit" : heightUnitController.text,  "weight" : weightController.text, "weightUnit" : weightUnitController.text, "target weight" : targetWeightController.text};
                          Navigator.pop(context, extractedData);
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: textFont,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    if (extractedData != null){
      setState(() {
        nameText = extractedData["username"];
        birthdayText = extractedData["birthday"];
        heightText = extractedData["height"];
        heightUnitText = extractedData["heightUnit"];
        weightText = extractedData["weight"];
        weightUnitText = extractedData["weightUnit"];
        targetWeightText = extractedData["target weight"];
      });
    }
  }
}

class SinglePeriodEnforcer extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text;
    // Allow only one period
    if ('.'.allMatches(newText).length <= 1) {
      return newValue;
    }
    return oldValue;
  }
}

class IconInfo extends StatelessWidget {
  const IconInfo({super.key, required this.iconAsset, required this.textColor});

  final String iconAsset;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconAsset,
      width: 100,
      height: 100,
      fit: BoxFit.fill,
      color: textColor,
    );
  }
}

class TextInfo extends StatelessWidget {
  const TextInfo({
    super.key,
    required this.textColor,
    required this.text,
    required this.textFont,
  });

  final Color textColor;
  final String text;
  final double textFont;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: 100 / textFont,
        color: textColor,
        fontSize: textFont,
      ),
    );
  }
}
