import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _firstName = "User";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_firstName),
        actions: [
          _buildEditButton()
        ],
      ),
      body: Center(child: Text("I am blablabla"),)
    );
  }

  IconButton _buildEditButton() {
    return IconButton(
      icon: Icon(Icons.edit_attributes),
      onPressed: _handleEditButtonPressed,
    );
  }

  void _handleEditButtonPressed() async {
    TextEditingController controller = TextEditingController(text: _firstName);

    final String? newFirstName = await showDialog<String>(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text("Edit Profile"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "username",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Dismiss without data
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, controller.text), // Return input
              child: Text("Save"),
            ),
          ],
        );
      } 
    );
    
    if (newFirstName != null) {
      setState(() {
        _firstName = newFirstName;
      });
    }
  }
}