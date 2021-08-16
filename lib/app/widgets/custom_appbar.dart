import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:squeeze/app/theme/app_colors.dart';

class CAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? title;
  final Color? color;
  final List<Widget>? actions;

  const CAppBar({
    Key? key,
    required this.title,
    this.color,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: key,
      backgroundColor: color ?? white,
      title: title,
      centerTitle: true,
      elevation: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
