import 'package:flutter/material.dart';
import 'package:gym_log/features/profile_page/widgets/utils.dart';
import 'package:intl/intl.dart';
import 'package:gym_log/features/profile_page/widgets/icon_info.dart';
import 'package:gym_log/features/profile_page/widgets/age_calculator.dart';
import 'package:gym_log/features/profile_page/widgets/text_info.dart';
import 'package:gym_log/features/profile_page/widgets/handle_edit_button.dart';



class ProfilePageHeader extends StatefulWidget {
  const ProfilePageHeader(BuildContext context, {super.key});

  @override
  State<ProfilePageHeader> createState() => _ProfilepageHeaderState();
}

class _ProfilepageHeaderState extends State<ProfilePageHeader> {
 @override
  Widget build(BuildContext context) {
  DateTime parseData = DateFormat("dd/MM/yyyy").parse(birthdayText);
  return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        )
      ),
      backgroundColor: backgroundColor,
      toolbarHeight: 150,
      elevation: 20.0,
      shadowColor: textColor,
      leading: Container(
        decoration: BoxDecoration(
          border: BoxBorder.all(color: textColor)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
          child: CircleAvatar(
            foregroundImage: AssetImage(imagePath),
          ),
        ),
      ),
      leadingWidth: 150,
      title: Container(
        decoration: BoxDecoration(
          border: BoxBorder.all(color: textColor)
        ),
        child: Text(
          nameText,
          style: TextStyle(color: textColor, fontSize: nameFont-4),
          maxLines: 2,
        ),
      ),
      actions: [
        HandleEditButton(context), 
        SizedBox(width: 20,),
      ],  
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: Container(
          decoration: BoxDecoration(
            border: BoxBorder.all(color: textColor)
          ),
          child: SizedBox(
            width: width-100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconInfo(iconAsset: birthdayIcon, textColor: textColor),
                TextInfo(textColor: textColor, text: age(DateTime.now(), parseData), textFont: textFont-4, width: width*0.25,),
                SizedBox(width: spacing,),
                IconInfo(iconAsset: heightIcon, textColor: textColor),
                TextInfo(textColor: textColor, text: '$heightText $heightUnitText', textFont: textFont-4, width: width*0.25,),
                SizedBox(width: spacing,),
                IconInfo(iconAsset: (genderText=="Male")?maleIcon :femaleIcon , textColor: textColor),
              ],
            ),
          ),
        )
      ),
    );
  }
}