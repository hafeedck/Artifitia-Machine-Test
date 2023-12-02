import 'package:artifitia_machine_test/controllers/splash_controller.dart';
import 'package:artifitia_machine_test/views/splash/spalsh_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Artifitia Machine Test",
        home: SplashView(),
      ),
    );
  }
}
