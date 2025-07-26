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
      child: ListTile(
        minTileHeight: 80,
        title: Text(tileName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),),
        leading: Icon(Icons.add, size: 24, color: Colors.deepPurple),
        tileColor: Colors.grey[200],
        textColor: Colors.deepPurple,
        onTap: onTap,
      ),
    );
  }
}