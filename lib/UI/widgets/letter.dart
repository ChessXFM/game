import 'package:appfour/UI/colors.dart';
import 'package:appfour/func/game.dart';
import 'package:flutter/material.dart';

Widget letter(String char, bool hidden, double rh, double rw) {
  return Container(
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(8),
    height: 60,
    width: 45,
    decoration: BoxDecoration(
        color: AppColor.mySeconderyColor.withAlpha(200),
        borderRadius: BorderRadius.circular(4)),
    child: Visibility(
      visible: !hidden,
      child: Center(
        child: Text(
          char,
          style: const TextStyle(
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pixel'),
        ),
      ),
    ),
  );
}

List<Widget> letterList(BuildContext context) {
  return Game.word
      .split('')
      .map((e) => letter(
          e.toUpperCase(),
          !Game.selectedLetter.contains(e.toUpperCase()),
          MediaQuery.of(context).size.height,
          MediaQuery.of(context).size.width))
      .toList();
}
