import 'package:artifitia_machine_test/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionView extends StatelessWidget {
  const OptionView({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final QuizState qnController = Provider.of<QuizState>(context);

        Color getTheRightColor() {
          if (qnController.isAnswered) {
            if (index == qnController.correctAns) {
              return Colors.green;
            } else if (index == qnController.selectedAns &&
                qnController.selectedAns != qnController.correctAns) {
              return Colors.red;
            }
          }
          return Colors.grey;
        }

        

        return InkWell(
          onTap: qnController.isAnswered ? null : press,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "${index + 1}. $text",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        );
      },
    );
  }
}
