import 'package:artifitia_machine_test/controllers/home_controller.dart';
import 'package:artifitia_machine_test/controllers/quiz_controller.dart';
import 'package:artifitia_machine_test/controllers/splash_controller.dart';
import 'package:artifitia_machine_test/route/page_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashState()),
        ChangeNotifierProvider(create: (_) => HomeState()),
        ChangeNotifierProvider(create: (_) => QuizState()),
        
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        title: "Artifitia Machine Test",
        initialRoute: '/splash',
      ),
    );
  }
}
