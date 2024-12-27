import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Icon buttonIcon;
  final Color buttonColor;
  final Function()? onPressed;
  final String name;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double padding;
  final double fontSize;
  const MyButton(this.buttonIcon, this.buttonColor, this.onPressed, this.name, this.backgroundColor, this.textColor,this.borderRadius, this.fontSize, this.padding, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Text(
              name,
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
    // MaterialButton(
    //   onPressed: onPressed,
    //   child: Container(
    //       padding: const EdgeInsets.all(7),
    //       decoration: BoxDecoration(
    //           // color: Colors.grey,
    //           border: Border.all(color: const Color.fromARGB(255, 186, 185, 185)),
    //           borderRadius: const BorderRadius.all(Radius.circular(50))),
    //       child: const Icon(Icons.more_horiz, color: Colors.black)),
    // );
  }
}