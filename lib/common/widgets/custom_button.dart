import 'package:amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
 final Color? color;
  const CustomButton({super.key, required this.text, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      child: Text(text,
       style: TextStyle(color: Colors.white
       ),),
      onPressed: onTap ,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: color,
      ),

    );
  }
}