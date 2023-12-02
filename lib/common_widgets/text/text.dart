import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Text homeTitle(String label) {
  return Text(
    label,
    textAlign: TextAlign.center,
    style: const TextStyle(
        color: Colors.black,
        fontFamily: 'Rubik',
        fontSize: 35,
        fontWeight: FontWeight.w600,
        height: 1.2),
  );
}

Text commontext(String label) {
  return Text(
    label,
    textAlign: TextAlign.center,
    style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Rubik',
        fontSize: 15,
        fontWeight: FontWeight.w500,
        height: 1.2),
  );
}
