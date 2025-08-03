import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import "package:camera/camera.dart";
import 'package:flutter/services.dart';
import 'package:gym_log/features/profile_page/widgets/utils.dart';
//import 'package:gym_log/features/profile_page/widgets/profile_page_header.dart';
import 'package:gym_log/features/profile_page/widgets/icon_info.dart';
import 'package:gym_log/features/profile_page/widgets/age_calculator.dart';
import 'package:gym_log/features/profile_page/widgets/text_info.dart';
import 'package:gym_log/features/profile_page/widgets/handle_edit_button.dart';

import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    _setUpCameraController();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
//Camera function (not working yet)
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _setUpCameraController();
    }
  }
//Camera widget (not working yet)
  Widget _buildUI() {
    if (cameraController == null ||
        cameraController?.value.isInitialized == false) {
      return const Center(child: CircularProgressIndicator());
    }
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Switch(
              value: cameraIndex == 0,
              onChanged: (value) {
                setState(() {
                  cameraIndex = 1 - cameraIndex;
                });
                _setUpCameraController();
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ClipRRect(
                child: CameraPreview(cameraController as CameraController),
              ),
            ),
            IconButton(
              onPressed: () async {
                XFile picture = await cameraController!.takePicture();

                Gal.putImage(picture.path, album: "test");
              },
              icon: Icon(Icons.camera),
              color: Colors.red,
              iconSize: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
//Camera controller (not working yet)
  Future<void> _setUpCameraController() async {
    List<CameraDescription> _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      setState(() {
        cameras = _cameras;

        cameraController = CameraController(
          cameras[cameraIndex],
          ResolutionPreset.high,
        );
      });
      cameraController?.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    DateTime parseData = DateFormat("dd/MM/yyyy").parse(birthdayText);
    //Profile page scaffold
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      //Profile page app bar
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        ),
        backgroundColor: backgroundColor,
        toolbarHeight: 150,
        elevation: 20.0,
        shadowColor: textColor,
        //Profile picture  
        leading: Container(
          decoration: BoxDecoration(border: BoxBorder.all(color: textColor)),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: CircleAvatar(foregroundImage: AssetImage(imagePath)),
          ),
        ),
        leadingWidth: 150,
        //Profile name
        title: Container(
          decoration: BoxDecoration(border: BoxBorder.all(color: textColor)),
          child: Text(
            nameText,
            style: TextStyle(color: textColor, fontSize: nameFont - 4),
            maxLines: 2,
          ),
        ),
        //Edit button
        actions: [HandleEditButton(context), SizedBox(width: 20)],
        //Profile infos as bottom
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Container(
            decoration: BoxDecoration(border: BoxBorder.all(color: textColor)),
            child: SizedBox(
              width: width - 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Profile age infos
                  IconInfo(iconAsset: birthdayIcon, textColor: textColor),
                  TextInfo(
                    textColor: textColor,
                    text: age(DateTime.now(), parseData),
                    textFont: textFont - 4,
                    width: width * 0.25,
                  ),
                  SizedBox(width: spacing),
                  //Profile height infos
                  IconInfo(iconAsset: heightIcon, textColor: textColor),
                  TextInfo(
                    textColor: textColor,
                    text: '$heightText $heightUnitText',
                    textFont: textFont - 4,
                    width: width * 0.25,
                  ),
                  SizedBox(width: spacing),
                  //Profile gender infos
                  IconInfo(iconAsset: genderIcon, textColor: textColor),
                ],
              ),
            ),
          ),
        ),
      ),
      //Profiel body (to be filled)
      body: SingleChildScrollView(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.2, top: spacing * 5),
                child: Column(children: [
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //Bottom navigator
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: "Workout Log",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Progress",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Strategies"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
