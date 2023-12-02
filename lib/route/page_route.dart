import 'package:artifitia_machine_test/views/home/home_view.dart';
import 'package:artifitia_machine_test/views/quiz/quiz_home_screen.dart';
import 'package:artifitia_machine_test/views/splash/spalsh_view.dart';
import 'package:artifitia_machine_test/views/sucess_failure_screen/failure_screen.dart';
import 'package:artifitia_machine_test/views/sucess_failure_screen/sucess_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  '/splash': (context) => const SplashView(),
  '/home': (context) => const HomeView(),
  '/quiz-home': (context) => const QuizHomeView(),
  '/success': (context) => const SuccessScreen(),
  '/failure': (context) => const FailureScreen(),
};
