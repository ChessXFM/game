import 'package:flutter/material.dart';

Widget customElevatedButtonForOptions(
    BuildContext context,
    String navigationPageRouteName,
    String label,
    double height,
    double width,
    double borderRadius,
    double fontSize,
    String fontFamily,
    Color color,
    double opacity,
    Function() whatToDo) {
  return ElevatedButton(
      clipBehavior: Clip.antiAlias,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        )),
        textStyle: const MaterialStatePropertyAll(TextStyle(inherit: true)),
        backgroundColor: MaterialStatePropertyAll(color.withOpacity(opacity)),
        fixedSize: MaterialStatePropertyAll(Size(width, height)),
      ),
      onPressed: () {
        if (navigationPageRouteName == '/levels') {
          Navigator.pushNamed(context, '/levels');
        } else if (navigationPageRouteName == '/difficulty') {
          Navigator.pushNamed(context, '/difficulty');
        } else {
          Navigator.pushReplacementNamed(context, navigationPageRouteName);
        }

        whatToDo();
      },
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
      ));
}

Widget customElevatedButtonForMusic(
    String label,
    double height,
    double width,
    double borderRadius,
    double fontSize,
    String fontFamily,
    Color color,
    double opacity,
    Function() whatToDo) {
  return ElevatedButton(
      clipBehavior: Clip.antiAlias,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        )),
        textStyle: const MaterialStatePropertyAll(TextStyle(inherit: true)),
        backgroundColor: MaterialStatePropertyAll(color.withOpacity(opacity)),
        fixedSize: MaterialStatePropertyAll(Size(width, height)),
      ),
      onPressed: () {
        whatToDo();
      },
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
      ));
}
