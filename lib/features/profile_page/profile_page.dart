import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import "package:camera/camera.dart";
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
  double spacing = 10.0;

  int cameraIndex = 0;
  List<CameraDescription> cameras = [];
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    _setUpCameraController();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (cameraController == null || cameraController?.value.isInitialized == false) {
      return;
    }
    if (state == AppLifecycleState.inactive){
      cameraController?.dispose();
    }else if (state == AppLifecycleState.resumed){
      _setUpCameraController();
    }
  }
  Widget _buildUI(){
    if (cameraController == null || cameraController?.value.isInitialized == false){
      return const Center(
        child: CircularProgressIndicator(),
        );
    }
    return SafeArea(child: SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Switch(value: cameraIndex == 0, onChanged: (value){setState(() {
            cameraIndex = 1 - cameraIndex;
          });
          _setUpCameraController();}),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.5,
            child: ClipRRect(
              
              child: CameraPreview(cameraController as CameraController,
              ),
            ),
          ),
          IconButton(onPressed: () async{
            XFile picture = await cameraController!.takePicture();
            
            Gal.putImage(picture.path, album: "test");
          }, 
          icon: Icon(Icons.camera), 
          color: Colors.red,
          iconSize: MediaQuery.of(context).size.height * 0.1,)
        ],
      ),
    ),);
  }
  Future<void> _setUpCameraController() async {
    List<CameraDescription> _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      setState(() {
        cameras = _cameras;
      
        cameraController = CameraController(
          cameras[cameraIndex], 
          ResolutionPreset.high);
      });
          cameraController?.initialize().then((_){
            if (!mounted){
              return;
            }
            setState(() {
              
            });
          });
    }
  }



  
  String age(DateTime today, DateTime birthdayDate) {
    Duration age = today.difference(birthdayDate);
    int year = age.inDays ~/ 365;
    int month = (age.inDays % 365) ~/ 30;
    int day = ((age.inDays % 365) % 30);

    switch (age.isNegative) {
      case true :
        return "Not born yet?";
      default :
        switch (year) {
          case <1 :
            switch (month) {
              case <1 :
                switch (day) {
                  case <=1:
                    return "1 day old";
                  default :
                    return "$day days old";
                }
              case 1 :
                return "1 month old";
              case >1 && !=12 :
                return "$month months old";
              default :
                return "11 months old";
            }
          case 1 :
            return "1 year old";
          default :
            return "$year years old";
        }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    spacing = height*0.010;
    DateTime parseData = DateFormat("dd/MM/yyyy").parse(birthdayText);
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(width/6),
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
                    webHtmlElementStrategy: WebHtmlElementStrategy.never,
                    scale: 0.5,
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
      body: SingleChildScrollView(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width*0.2, top: spacing*5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconInfo(iconAsset: birthdayIcon, textColor: textColor, width: width, height : height),
                        SizedBox(width: spacing),
                        TextInfo(textColor: textColor, text: birthdayText, textFont: textFont, width: width, height : height),
                      ],
                    ),
                    SizedBox(height: spacing),
                    Row(
                      children: [
                        IconInfo(iconAsset: ageIcon, textColor: textColor, width: width, height : height),
                        SizedBox(width: spacing),
                        TextInfo(textColor: textColor, text: age(DateTime.now(), parseData), textFont: textFont, width: width, height : height),
                      ],
                    ),
                    SizedBox(height: spacing),
                    Row(
                      children: [
                        IconInfo(iconAsset: heightIcon, textColor: textColor, width: width, height : height),
                        SizedBox(width: spacing),
                        TextInfo(textColor: textColor, text: "$heightText $heightUnitText", textFont: textFont, width: width, height : height),
                      ],
                    ),
                    SizedBox(height: spacing),
                    Row(
                      children: [
                        IconInfo(iconAsset: weightIcon, textColor: textColor, width: width, height : height),
                        SizedBox(width: spacing),
                        TextInfo(textColor: textColor, text: "$weightText $weightUnitText", textFont: textFont, width: width, height : height),
                      ],
                    ),
                    SizedBox(height: spacing),
                    Row(
                      children: [
                        IconInfo(iconAsset: targetWeightIcon, textColor: textColor, width: width, height : height),
                        SizedBox(width: spacing),
                        TextInfo(textColor: textColor, text: "$targetWeightText $weightUnitText", textFont: textFont, width: width, height : height),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextButton handleEditButton(BuildContext context) {
    return TextButton(
      onPressed: handleEditButtonPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1),
        child: Container(
          margin: EdgeInsetsDirectional.only(end: spacing*2.5),
          constraints: BoxConstraints(
            maxHeight: height * 0.075,
            maxWidth: height * 0.10,
          ),
          child: Image.asset(
            editIcon,
            width: width * 0.1,
            height: width * 0.075,
            fit: BoxFit.fill,
            color: textColor,
          ),
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
          scrollable: true,
          backgroundColor: backgroundColor,
          insetPadding: EdgeInsets.only(top: 100, bottom: 0,),
          content: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsetsGeometry.directional(top: 20.0),
                child: Column(
                  children: [
                    Text(
                      "Modify your profile information",
                      style: TextStyle(fontSize: textFont, color: textColor),
                    ),
                    SizedBox(height: 20),
                    //_buildUI(),
                    //SizedBox(height: 20),
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
                      style: TextStyle(fontSize: textFont - 4, color: textColor),
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
                      style: TextStyle(fontSize: textFont - 4, color: textColor),
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
                          color: textColor,
                          fontSize: textFont - 8,
                          height: (textFont - 8) / textFont,
                        ),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        TextField(
                          style: TextStyle(fontSize: textFont - 4, color: textColor),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
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
                            dropdownColor: backgroundColor,
                            value: heightUnitController.text,
                            items: heightList.map<DropdownMenuItem<String>>((
                              String unit,
                            ) {
                              return DropdownMenuItem<String>(
                                value: unit,
                                child: Text(
                                  unit,
                                  style: TextStyle(
                                    color: textColor,
                                  ),),
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
                        )
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
                          style: TextStyle(fontSize: textFont - 4, color: textColor),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
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
                        )
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
                        TextFormField(
                          style: TextStyle(fontSize: textFont - 4, color: textColor),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(6),
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
                            disabledHint: Text(weightUnitController.text, style: TextStyle(color: textColor),),
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
                            onChanged: null,
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
  const IconInfo({super.key, required this.iconAsset, required this.textColor, required this.width, required this.height});

  final String iconAsset;
  final Color textColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height*0.12,
        maxWidth: height*0.12,
      ),
      child: Image.asset(
        iconAsset,
        width: width/5.5,
        height: width/5.5,
        fit: BoxFit.fill,
        color: textColor,
      ),
    );
  }
}

class TextInfo extends StatelessWidget {
  const TextInfo({
    super.key,
    required this.textColor,
    required this.text,
    required this.textFont,
    required this.width,
    required this.height,
  });

  final Color textColor;
  final String text;
  final double textFont;
  final double width;
  final double height; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width*0.45,
      child: Text(
        text,
        style: TextStyle(
          height: height / 15.5 / textFont,
          color: textColor,
          fontSize: textFont,
        ),
      ),
    );
  }
}
