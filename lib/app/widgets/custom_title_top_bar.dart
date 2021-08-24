import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_text.dart';

class CTitleTopBar extends StatelessWidget {
  final title;
  final Alignment? alignment;
  final double? bottomPadding;

  const CTitleTopBar({
    this.title,
    this.alignment,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: bottomPadding ?? 70,
        top: AppBar().preferredSize.height + 20,
      ),
      alignment: alignment ?? Alignment.center,
      child: CText(
        height: 1,
        text: title,
        fontWeight: FontWeight.w700,
        color: secondaryColor,
        fontSize: 17.sp,
      ),
    );
  }
}
