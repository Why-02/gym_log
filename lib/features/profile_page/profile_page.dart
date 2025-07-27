import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String imagePath = "";

  String nameText = "Snowi";
  String birthdayText = "3/13/2024";
  String ageText = "Age";
  String heightText = "10 cm";
  String weightText = "4.4 Kg";
  String targetWeightText = "4.6 Kg";

  String nameTextTemp = "No username";
  String birthdayTextTemp = "Birthday";
  String heightTextTemp = "Height";
  String weightTextTemp = "Weight";
  String targetWeightTextTemp = "Target Weight";

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
  DateTime selectedDate = DateTime(2000, 01, 01);

  String age(DateTime today, DateTime birthdayDate) {
    final year = today.year - birthdayDate.year;
    final mth = today.month - birthdayDate.month;
    final days = today.day - birthdayDate.day;
    //birthdayText = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
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
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                  textFont: textFont,
                ),
                SizedBox(height: spacing),
                TextInfo(
                  textColor: textColor,
                  text: age(DateTime.now(), selectedDate),
                  textFont: textFont,
                ),
                SizedBox(height: spacing),
                TextInfo(
                  textColor: textColor,
                  text: heightText,
                  textFont: textFont,
                ),
                SizedBox(height: spacing),
                TextInfo(
                  textColor: textColor,
                  text: weightText,
                  textFont: textFont,
                ),
                SizedBox(height: spacing),
                TextInfo(
                  textColor: textColor,
                  text: targetWeightText,
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
    
    final List<String>? extractedData = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                    controller: birthdayController,
                    style: TextStyle(fontSize: textFont - 4),
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                        locale: const Locale('en', 'CH'),
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2030),
                        currentDate: selectedDate,
                      );
                      if (date != null) {
                        setState(() {
                          selectedDate = date;
                          birthdayTextTemp =
                              "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                        });
                      }
                    },
                    decoration: InputDecoration(hintText: birthdayTextTemp),
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
                  TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[\d\.]')),
                      SinglePeriodEnforcer(),
                    ],
                    keyboardType: TextInputType.numberWithOptions(),
                    controller: heightController,
                    decoration: InputDecoration(hintText: "Update your height"),
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
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[\d\.]')),
                      SinglePeriodEnforcer(),
                    ],
                    keyboardType: TextInputType.numberWithOptions(),
                    controller: weightController,
                    decoration: InputDecoration(hintText: "Update your weight"),
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
                  SizedBox(height: 30),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, {userNameController.text, birthdayController.text, heightController.text, weightController.text, targetWeightController.text});
                        },
                        child: Text("Save"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    if (extractedData != null){
      setState(() {
        nameText = extractedData[0];
        birthdayText = extractedData[1];
        heightText = extractedData[2];
        weightText = extractedData[3];
        targetWeightText = extractedData[4];
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
