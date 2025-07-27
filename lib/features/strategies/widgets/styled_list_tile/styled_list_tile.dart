import 'package:flutter/material.dart';

class StyledListTile extends StatelessWidget {
  final String tileName;
  final Function()? onTap;

  const StyledListTile({
    super.key,
    required this.tileName,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Adjust the radius as needed
            ),
            minTileHeight: 80,
            title: Text(tileName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            textColor: Colors.deepPurple,
            onTap: onTap,
          ),
      ),
    );
  }
}