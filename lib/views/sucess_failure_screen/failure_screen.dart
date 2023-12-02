import 'package:artifitia_machine_test/common_widgets/buttons/common_button.dart';
import 'package:artifitia_machine_test/common_widgets/colors/colors.dart';
import 'package:artifitia_machine_test/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: primaryColor,
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/images/failure_screen.png',
          fit: BoxFit.fill,
        ),
        25.0.spaceY,
        SizedBox(
          width: size.width * 0.4,
          child: CommonButtonWidget(
            label: "Try again..!",
            color: Colors.red,
            onClick: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/splash', (route) => false);
            },
            fontSize: 18,
          ),
        )
      ])),
    ));
  }
}
