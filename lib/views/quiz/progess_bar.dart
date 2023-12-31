import 'package:artifitia_machine_test/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProgressBar extends StatefulWidget {
  AnimationController? animationController;
  ProgressBar({Key? key, this.animationController}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    final QuizState controller = Provider.of<QuizState>(context);
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      height: size.height * 0.055,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF3F4768), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Builder(
        builder: (context) {
          return Stack(
            children: [
              // LayoutBuilder provides us the available space for the container
              // constraints.maxWidth needed for our animation
              LayoutBuilder(
                builder: (context, constraints) => AnimatedBuilder(
                  animation: widget.animationController!,
                  builder: (context, child) => Container(
                    // Move from right to left by multiplying the animated value with max width
                    width: widget.animationController!.value *
                        constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: controller.pogressColor(controller.count),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${(controller.count * 40).round()}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
