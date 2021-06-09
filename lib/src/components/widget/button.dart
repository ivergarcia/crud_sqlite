import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/colors.dart';

class Button extends StatelessWidget {
  final String title;
  final Color color;
  final void Function() onPressed;
  const Button({Key key, @required this.title, this.color, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(title),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: color == null ? AppColors.blueColor : color)
        ),
        primary: color == null ? AppColors.blueColor : color,
        padding: EdgeInsets.symmetric(horizontal: 100),
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
      onPressed: () => onPressed(),
    );
  }
}