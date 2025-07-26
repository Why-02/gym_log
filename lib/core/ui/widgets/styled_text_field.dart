import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StyledTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final bool lockable;
  final double? width;
  bool readOnly;
  bool locked;
  StyledTextField({super.key, required this.controller, required this.hintText, required this.labelText, this.keyboardType = TextInputType.text, this.lockable = false, this.locked = false, this.width ,this.readOnly = false});

  @override
  State<StyledTextField> createState() => _StyledTextFieldState();
}

class _StyledTextFieldState extends State<StyledTextField> {
  @override
  Widget build(BuildContext context) {
    final WIDTH = MediaQuery.of(context).size.width;
    final HEIGHT = MediaQuery.of(context).size.height;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        (widget.lockable ? 
          IconButton(
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.zero )),
            onPressed: (){setState(() {
              widget.locked = !widget.locked;
              });
            }, 
            icon: (widget.locked ? Icon(Icons.lock) : Icon(Icons.lock_open
          )))
          : SizedBox(width:0)),
        SizedBox(
          width:(widget.width ?? WIDTH/2 - WIDTH/10 * (widget.lockable ? 1 : 0)),
          height:HEIGHT/15,
          child: TextField(
            readOnly: widget.readOnly,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            decoration: InputDecoration(          
              hintText: widget.hintText,
              labelText: widget.labelText,
              enabled: !widget.locked,
            ),
          ),
        ),
      ],
    );
  }
}