import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_log/features/profile_page/widgets/utils.dart';
import 'package:intl/intl.dart';
import 'package:gym_log/features/profile_page/widgets/single_period_enforcer.dart';

class HandleEditButton extends StatefulWidget {
  const HandleEditButton(BuildContext context, {super.key});

  @override
  State<HandleEditButton> createState() => _HandleEditButtonState();
}

class _HandleEditButtonState extends State<HandleEditButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: handleEditButtonPressed,
      child: Image(
        image: AssetImage(editIcon),
        width: 40,
        height: 40,
        fit: BoxFit.fill,
        color: textColor,
      ),
    );
  }

  void handleEditButtonPressed() async {
    TextEditingController userNameController = TextEditingController(
      text: nameText,
    );
    TextEditingController birthdayController = TextEditingController(
      text: birthdayText,
    );
    TextEditingController heightController = TextEditingController(
      text: heightText,
    );
    TextEditingController weightController = TextEditingController(
      text: weightText,
    );
    TextEditingController targetWeightController = TextEditingController(
      text: targetWeightText,
    );
    TextEditingController heightUnitController = TextEditingController(
      text: heightUnitText,
    );
    TextEditingController weightUnitController = TextEditingController(
      text: weightUnitText,
    );
    TextEditingController genderController = TextEditingController(
      text: genderText,
    );

    final Map<String, dynamic>? extractedData = await showDialog(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => AlertDialog(
          scrollable: true,
          backgroundColor: backgroundColor,
          content: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsetsGeometry.directional(top: 20.0),
                child: Column(
                  children: [
                    Text(
                      "Update your profile",
                      style: TextStyle(fontSize: textFont, color: textColor),
                      maxLines: 1,
                    ),
                    SizedBox(height: 20),
                    //_buildUI(),
                    CircleAvatar(
                      radius: 75,
                      foregroundImage: AssetImage(imagePath),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Username",
                        style: TextStyle(
                          color: textColor,
                          fontSize: textFont - 8,
                          height: (textFont - 8) / textFont,
                        ),
                      ),
                    ),
                    TextField(
                      style: TextStyle(
                        fontSize: textFont - 4,
                        color: textColor,
                      ),
                      controller: userNameController,
                      decoration: InputDecoration(
                        hintText: "Update your username",
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Birthday",
                        style: TextStyle(
                          color: textColor,
                          fontSize: textFont - 8,
                          height: (textFont - 8) / textFont,
                        ),
                      ),
                    ),
                    TextField(
                      readOnly: true,
                      enableInteractiveSelection: false,
                      controller: birthdayController,
                      style: TextStyle(
                        fontSize: textFont - 4,
                        color: textColor,
                      ),
                      onTap: () async {
                        DateTime parseData = DateFormat(
                          "dd/MM/yyyy",
                        ).parse(birthdayController.text);
                        DateTime? date = await showDatePicker(
                          locale: const Locale('en', 'GB'),
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2030),
                          currentDate: parseData,
                        );
                        if (date != null) {
                          setState(() {
                            birthdayController.text =
                                "${date.day}/${date.month}/${date.year}";
                          });
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Gender",
                        style: TextStyle(
                          color: textColor,
                          fontSize: textFont - 8,
                          height: (textFont - 8) / textFont,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                      dropdownColor: backgroundColor,
                      value: genderText,
                      items: genderList.map<DropdownMenuItem<String>>((
                        String gender,
                      ) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender, style: TextStyle(color: textColor)),
                        );
                      }).toList(),
                      onChanged: (String? newGender) {
                        setState(() {
                          genderText = newGender!;
                        });
                      },
                      decoration: InputDecoration(
                        hoverColor: backgroundColor,
                      ),
                      style: TextStyle(
                        fontSize: textFont - 4,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Height",
                        style: TextStyle(
                          color: textColor,
                          fontSize: textFont - 8,
                          height: (textFont - 8) / textFont,
                        ),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        TextField(
                          style: TextStyle(
                            fontSize: textFont - 4,
                            color: textColor,
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[\d\.]'),
                            ),
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
                            dropdownColor: backgroundColor,
                            value: heightUnitController.text,
                            items: heightList.map<DropdownMenuItem<String>>((
                              String unit,
                            ) {
                              return DropdownMenuItem<String>(
                                value: unit,
                                child: Text(
                                  unit,
                                  style: TextStyle(color: textColor),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newUnit) {
                              setState(() {
                                heightUnitController.text = newUnit!;
                              });
                            },
                            decoration: InputDecoration(
                              hoverColor: backgroundColor,
                              border: InputBorder.none,
                              constraints: BoxConstraints(
                                minWidth: 60,
                                maxWidth: 60,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: textFont - 4,
                              color: textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Weight",
                        style: TextStyle(
                          color: textColor,
                          fontSize: textFont - 8,
                          height: (textFont - 8) / textFont,
                        ),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(
                            fontSize: textFont - 4,
                            color: textColor,
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[\d\.]'),
                            ),
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
                            dropdownColor: backgroundColor,
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
                                minWidth: 60,
                                maxWidth: 60,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: textFont - 4,
                              color: textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Target Weight",
                        style: TextStyle(
                          color: textColor,
                          fontSize: textFont - 8,
                          height: (textFont - 8) / textFont,
                        ),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: DropdownButtonFormField(
                            disabledHint: Text(
                              weightUnitController.text,
                              style: TextStyle(color: textColor),
                            ),
                            dropdownColor: backgroundColor,
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
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              constraints: BoxConstraints(
                                minWidth: 60,
                                maxWidth: 60,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: textFont - 4,
                              color: textColor,
                            ),
                          ),
                        ),
                        TextFormField(
                          style: TextStyle(
                            fontSize: textFont - 4,
                            color: textColor,
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[\d\.]'),
                            ),
                            SinglePeriodEnforcer(),
                          ],
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: targetWeightController,
                          decoration: InputDecoration(
                            hintText: "Update your target weight",
                          ),
                        ),
                      ],
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
                            style: TextStyle(fontSize: textFont),
                          ),
                        ),
                        SizedBox(width: 50),
                        ElevatedButton(
                          onPressed: () {
                            Map<String, String> extractedData = {
                              "username": userNameController.text,
                              "birthday": birthdayController.text,
                              "height": heightController.text,
                              "heightUnit": heightUnitController.text,
                              "weight": weightController.text,
                              "weightUnit": weightUnitController.text,
                              "target weight": targetWeightController.text,
                              "gender": genderController.text,
                            };
                            Navigator.pop(context, extractedData);
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(fontSize: textFont),
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
      ),
    );
    if (extractedData != null) {
      setState(() {
        nameText = extractedData["username"];
        birthdayText = extractedData["birthday"];
        heightText = extractedData["height"];
        heightUnitText = extractedData["heightUnit"];
        weightText = extractedData["weight"];
        weightUnitText = extractedData["weightUnit"];
        targetWeightText = extractedData["target weight"];
        genderText = extractedData["gender"];
      });
    }
  }
}
