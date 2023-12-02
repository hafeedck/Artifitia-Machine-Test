import 'package:artifitia_machine_test/common_widgets/colors/buttons/common_button.dart';
import 'package:artifitia_machine_test/common_widgets/colors/colors.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  onClick: () {},
                  fontSize: 18,
                ),
              )
            ],
          ),
        ));
  }
}
