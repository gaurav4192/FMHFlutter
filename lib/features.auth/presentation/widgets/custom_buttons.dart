import 'package:flutter/material.dart';

import '../../../resources/AppColors.dart';
import '../../../resources/border_radius.dart';




class CustomPrimaryButton extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  final VoidCallback onClick;

  const CustomPrimaryButton({
    Key? key,
    required this.buttonColor,
    required this.textValue,
    required this.textColor,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: FxRadius.all(20.0),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(0),
        height: 60,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: FxRadius.all(20.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onClick,
            borderRadius: FxRadius.all(5.0),
            child: Center(
              child: Text(
                textValue,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: textColor, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPrimaryButtonTransparent extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  final VoidCallback onClick;

  const CustomPrimaryButtonTransparent({
    Key? key,
    required this.buttonColor,
    required this.textValue,
    required this.textColor,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: FxRadius.all(0.0),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(0),
        height: 60,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: FxRadius.all(5.0),
            border: Border.all(color: AppColors.primaryColor)
        ),

        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onClick,
            borderRadius: FxRadius.all(5.0),
            child: Center(
              child: Text(
                textValue,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: textColor, fontSize: 16,fontWeight:FontWeight.w700 ),

              ),
            ),
          ),
        ),
      ),
    );
  }
}
