import 'package:artifitia_machine_test/common_widgets/card/question_card.dart';
import 'package:artifitia_machine_test/common_widgets/colors/colors.dart';
import 'package:artifitia_machine_test/controllers/quiz_controller.dart';
import 'package:artifitia_machine_test/views/quiz/progess_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizHomeView extends StatefulWidget {
  const QuizHomeView({super.key});

  @override
  State<QuizHomeView> createState() => _QuizHomeViewState();
}

class _QuizHomeViewState extends State<QuizHomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    // Start the animation
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Provider.of<QuizState>(context, listen: false)
            .nextQuestion(_animationController, context);
      }
    });
    _animationController.addListener(() {
      // This block will be executed whenever the animation value changes
      Provider.of<QuizState>(context, listen: false).count =
          _animationController.value;
      if (_animationController.value == 5.0) {
        // ignore: void_checks
        return Provider.of<QuizState>(context, listen: false)
            .pogressColor(_animationController.value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final QuizState controller = Provider.of<QuizState>(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: primaryColor,
            body: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                ProgressBar(
                  animationController: _animationController,
                ),
                SizedBox(
                  height: size.height * 0.18,
                ),
              ]),
              SizedBox(
                height: size.height * 0.6,
                width: size.width * 0.5,
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pagecontroller,
                  onPageChanged: controller.updateTheQnNum,
                  itemCount: controller.questionList.length,
                  itemBuilder: (context, index) => QuestionCard(
                    questions: controller.questionList[index],
                    animationController: _animationController,
                  ),
                ),
              )
            ])));
  }
}
