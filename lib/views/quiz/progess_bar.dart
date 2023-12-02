import 'package:artifitia_machine_test/common_widgets/colors/colors.dart';
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

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    widget.animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    // Start the animation
    widget.animationController!.forward();
  }

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
                builder: (context, constraints) => Container(
                  // Use AnimatedBuilder to rebuild only when the animation changes
                  child: AnimatedBuilder(
                    animation: widget.animationController!,
                    builder: (context, child) => Container(
                      // Move from right to left by multiplying the animated value with max width
                      width: widget.animationController!.value *
                          constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: progessbarColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
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
                        "${(widget.animationController!.value * 10).round()}",
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

  @override
  void dispose() {
    // Dispose of the animation controller to free up resources
    widget.animationController!.dispose();
    super.dispose();
  }
}
