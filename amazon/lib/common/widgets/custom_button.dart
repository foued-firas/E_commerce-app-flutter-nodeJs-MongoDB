import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      child: Text(text,
       style: TextStyle(color: Colors.white
       ),),
      onPressed: onTap ,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: GlobalVariables.secondaryColor,
      ),
    );
  }
}