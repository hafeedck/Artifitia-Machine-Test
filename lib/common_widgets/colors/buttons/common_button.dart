import 'package:artifitia_machine_test/common_widgets/colors/colors.dart';
import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  final String label;
  final Color? color;
  final double? fontSize;
  final double? borderRadius;
  final VoidCallback onClick;
  final bool? isLoading;

  const CommonButtonWidget(
      {super.key,
      required this.label,
      required this.onClick,
      this.fontSize,
      this.isLoading,
      this.borderRadius = 10,
      this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * .07,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius!),
              color: buttonColor),
          child: isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Center(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
    );
  }
}
