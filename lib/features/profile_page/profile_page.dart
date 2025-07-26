import 'dart:io';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String imagePath = "";
  final String nameText = "No username";
  final double nameFont = 26;
  final double width = 412;
  final double height = 915;
  final Color appBarBackgroundColor = Colors.black;
  final Color appBarTextColor = Colors.white;
  final Color backgroundColor = Colors.white;
  final Color textColor = Colors.black;
  final double textFont = 20;
  String birthdayText = "Birthday";
  String ageText = "Age";
  String heightText = "Height";
  String weightText = "Weight";
  String targetWeightText = "Target Weight";
  final String editIcon = "icons/edit_icon.png";
  final String birthdayIcon = "icons/birthday_icon.png";
  final String ageIcon = "icons/age_icon.png";
  final String heightIcon = "icons/height_icon.png";
  final String weightIcon = "icons/weight_icon.png";
  final String targetWeightIcon = "icons/target_weight_icon.png";
  final double spacing = 10.0;
  DateTime selectedDate = DateTime.now();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController targetWeightController = TextEditingController();

@override
  void dispose() {
    super.dispose();
    birthdayController.dispose();
    heightController.dispose();
    weightController.dispose();
    targetWeightController.dispose();
  }
@override
  void initState() {
    super.initState();
    setState(() {
      heightText = heightController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor,
        toolbarHeight: height / 6,
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
          style: TextStyle(color: appBarTextColor, fontSize: nameFont),
        ),
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
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
                              style: TextStyle(
                                fontSize: textFont,
                                color: textColor,
                              ),
                            ),
                            ElevatedButton(
                              style:ButtonStyle(
                                elevation: WidgetStatePropertyAll(0),
                                alignment: Alignment.centerLeft,
                              ),
                              onPressed: () async {
                                DateTime? date = await showDatePicker(
                                  context: context, 
                                  firstDate: DateTime(1900), 
                                  lastDate: DateTime(2030),
                                  currentDate: selectedDate,  
                                );
                                if (date != null)
                                {
                                  setState(() {
                                    selectedDate = date;
                                  },
                                  );
                                }
                              }, 
                              child: Text("$selectedDate"),
                            ),
                            TextField(
                              controller: heightController,
                              decoration: InputDecoration(
                                labelText: "Height",
                                hintText: "Update your height",
                              ),
                            ),
                            TextFormField(
                              controller: weightController,
                              decoration: InputDecoration(
                                labelText: "Weight",
                                hintText: "Update your weight",
                              ),
                            ),
                            TextFormField(
                              controller: targetWeightController,
                              decoration: InputDecoration(
                                labelText: "Target weight",
                                hintText: "Update your target weight",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child: Image.asset(
                editIcon,
                width: 66 / 1.5,
                height: 40 / 1.5,
                fit: BoxFit.fill,
                color: appBarTextColor,
              ),
            ),
          ),
        ],
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
                  text: birthdayText,
                  textFont: textFont,
                ),
                SizedBox(height: spacing),
                TextInfo(
                  textColor: textColor,
                  text: ageText,
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
