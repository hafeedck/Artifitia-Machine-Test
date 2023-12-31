import 'package:artifitia_machine_test/common_widgets/buttons/common_button.dart';
import 'package:artifitia_machine_test/common_widgets/text/text.dart';
import 'package:artifitia_machine_test/controllers/quiz_controller.dart';
import 'package:artifitia_machine_test/models/question_model.dart';
import 'package:artifitia_machine_test/views/quiz/options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionCard extends StatelessWidget {
  final AnimationController? animationController;

  const QuestionCard({
    Key? key,
    this.questions,
    this.animationController,
  }) : super(key: key);

  final QuestionModel? questions;

  @override
  Widget build(BuildContext context) {
    final QuizState controller = Provider.of<QuizState>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: commontext(
                questions!.question,
              ),
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        SizedBox(
          height: size.height * 0.4,
          // width: size.width*0.70,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: questions!.options.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: controller.getTheRightColor(index) == Colors.green
                          ? Colors.green
                          : controller.getTheRightColor(index) == Colors.red
                              ? Colors.red
                              : Colors.transparent,
                      border:
                          Border.all(width: 1, color: const Color(0xff878787)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: OptionView(
                            index: index,
                            text: questions!.options[index].text,
                            press: () {
                              controller.checkAns(questions!, index,
                                  animationController!, context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
            width: size.width * 0.3,
            child: CommonButtonWidget(
              label: "Next",
              color: Colors.white,
              textcolorcolor: Colors.black,
              onClick: () {
                controller.nextQuestion(animationController!, context);
              },
              fontSize: 18,
            )),
      ],
    );
  }
}
