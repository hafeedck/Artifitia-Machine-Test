import 'package:artifitia_machine_test/common_widgets/buttons/common_button.dart';
import 'package:artifitia_machine_test/common_widgets/colors/colors.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: primaryColor,
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'assets/images/success_screen.png',
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: 25,
        ),
        SizedBox(
          width: size.width * 0.4,
          child: CommonButtonWidget(
            label: "Try again..!",
            color: Colors.green,
            onClick: () {},
            fontSize: 18,
          ),
        )
      ])),
    ));
  }
}
