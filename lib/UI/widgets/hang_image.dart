import 'package:flutter/material.dart';

Widget hangimage(bool visible, String path) {
  return Visibility(
      visible: visible,
      child: SizedBox(
        height: 150,
        width: 150,
        child: Image.asset(path),
      ));
}
