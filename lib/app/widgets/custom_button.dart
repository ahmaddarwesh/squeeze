import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:supercharged/supercharged.dart';

class CButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final EdgeInsets? padding;
  final onTap;
  final Color? color;
  final double? width;
  final double? height;
  final double? radius;
  final Border? border;
  final EdgeInsets? margin;
  final bool disable;
  final FontWeight? fontWight;
  final double? opacity;
  final bool withAnimated;

  CButton({
    this.text,
    this.onTap,
    this.child,
    this.color,
    this.padding,
    this.width,
    this.height,
    this.radius,
    this.border,
    this.margin,
    this.disable = false,
    this.fontWight,
    this.opacity,
    this.withAnimated = false,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disable,
      child: Container(
        width: width,
        margin: margin,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 13),
          border: border,
          color: disable ? Colors.grey[300] : color,
        ),
        child: CupertinoButton(
          pressedOpacity: opacity ?? 0.4,
          disabledColor: Colors.black12,
          borderRadius: BorderRadius.circular(radius ?? 15),
          child: child ??
              CText(
                text: text!,
                fontSize: 13.sp,
                color: disable ? Colors.grey[500] : primaryColor,
                fontWeight: fontWight ?? FontWeight.w600,
              ),
          onPressed: onTap,
          padding: padding ?? EdgeInsets.zero,
          // color: disable ? Colors.grey[300] : color,
        ),
      ),
    );
  }
}
