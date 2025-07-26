import 'package:flutter/material.dart';

const int numberOfExpectedTabs = 4;

class TabScaffold extends StatefulWidget{
  final List<Widget> tabs;
  const TabScaffold({
    super.key, 
    required this.tabs
  }): assert(tabs.length == numberOfExpectedTabs, "Incorrect number of tabs, expected $numberOfExpectedTabs received ${tabs.length}");

  @override
  State<TabScaffold> createState() => _TabScaffoldState();
}

class _TabScaffoldState extends State<TabScaffold> {
  int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.note_add), label: "Workout Log"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Strategies"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ]
      ),
    );
  }
}