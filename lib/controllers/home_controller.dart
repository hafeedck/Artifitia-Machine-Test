import 'package:artifitia_machine_test/service/sql_database.dart';
import 'package:flutter/material.dart';

class HomeState extends ChangeNotifier {
  final databaseHelper = DatabaseHelper();
  insertDatabase() async {
    await databaseHelper.clearRoutes();
  }
}
