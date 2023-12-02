import 'package:artifitia_machine_test/common_widgets/buttons/common_button.dart';
import 'package:artifitia_machine_test/common_widgets/colors/colors.dart';
import 'package:artifitia_machine_test/controllers/quiz_controller.dart';
import 'package:artifitia_machine_test/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final QuizState quizcontroller = Provider.of<QuizState>(context);
    final SplashState controller = Provider.of<SplashState>(context);
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/loader_image.png',
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: size.width * 0.4,
                child: CommonButtonWidget(
                  label: "Start Quiz",
                  color: buttonColor,
                  onClick: () {
                    quizcontroller.reset();
                    controller.insertDatabase();
                    quizcontroller.fetchQuestions();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/quiz-home', (route) => false);
                  },
                  fontSize: 18,
                ),
              )
            ],
          ),
        ));
  }
}
