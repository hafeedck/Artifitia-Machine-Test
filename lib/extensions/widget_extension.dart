import 'package:flutter/material.dart';

extension SpaceXy on double {
  SizedBox get spaceX => SizedBox(width: this);
  SizedBox get spaceY => SizedBox(height: this);
}
