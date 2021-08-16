import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:squeeze/app/widgets/custom_text.dart';

class CButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final EdgeInsets? padding;
  final onTap;
  final Color? color;
  final double? width;
  final double? height;
  final double? radius;

  CButton({
    this.text,
    this.onTap,
    this.child,
    this.color,
    this.padding,
    this.width,
    this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(radius ?? 15),
        child: child ??
            CText(
              text: text!,
            ),
        onPressed: onTap,
        padding: padding ?? EdgeInsets.zero,
        color: color,
      ),
    );
  }
}
