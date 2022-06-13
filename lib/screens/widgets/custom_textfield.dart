import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class CustomTextField extends StatelessWidget {
  final bool obscureText;
  final TextEditingController? controller;
  TextInputType? keyboardType;
  String? hintText='';
  Widget? preffixIcon;
  Widget? suffixIcon;

  CustomTextField({
   required this.obscureText,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.preffixIcon,
    this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.padding20, right: Dimensions.padding20),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.white,
              ),
        ),
        child: TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          controller: TextEditingController(),
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: preffixIcon,
            suffixIcon: suffixIcon
          ),
        ),
      ),
    );
  }
}
