
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppColors.dart';

class AppThemeFilledButton extends StatelessWidget {
  final bool isSmallWidget;
  final String imagePath;
  final String title;
  final TextStyle? titleStyle;
  final bool setIconAtRight;
  final bool showIcon;
  final Color backgroundColor;
  final double height;
  final double width;
  final Function() onPressed;

  const AppThemeFilledButton({
    super.key,
    this.isSmallWidget = true,
    this.imagePath = '',
    required this.title,
    this.titleStyle,
    this.setIconAtRight = false,
    this.showIcon = true,
    this.backgroundColor = AppColors.primaryColor,
    required this.height,
    this.width = 100,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(height/2.0),
            // image: DecorationImage(
            //   image: AssetImage('assets/images/ic_bg_button.png'),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: !setIconAtRight && showIcon,
                child: SizedBox(
                  width: isSmallWidget ? 16 : 20,
                  height: isSmallWidget ? 16 : 20,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Visibility(
                  visible: !setIconAtRight && showIcon,
                  child: SizedBox(width: isSmallWidget ? 4 : 8)
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: titleStyle != null ? titleStyle : TextStyle(
                  color: Colors.white,
                  fontWeight: isSmallWidget ? FontWeight.w400 : FontWeight.w500,
                  fontSize: isSmallWidget ? 10 : 14,
                  fontFamily: "assets/fonts/Inter-Regular.ttf",
                ),
              ),
              Visibility(
                  visible: setIconAtRight && showIcon,
                  child: SizedBox(width: isSmallWidget ? 4 : 8)
              ),
              Visibility(
                visible: setIconAtRight && showIcon,
                child: SizedBox(
                  width: isSmallWidget ? 16 : 20,
                  height: isSmallWidget ? 16 : 20,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}