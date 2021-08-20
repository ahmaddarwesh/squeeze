import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_text.dart';
import 'package:supercharged/supercharged.dart';

class CTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final Widget? leftWidget;

  const CTextField({Key? key, this.hint, this.controller, this.leftWidget});

  @override
  _CTextFieldState createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  late FocusNode focus;
  late Border border;

  @override
  void initState() {
    border = Border.all(width: 1.5, color: Colors.grey[300]!);
    focus = FocusNode();
    focus.addListener(() {
      setState(() {
        if (focus.hasFocus) {
          border = Border.all(width: 1.2, color: Colors.grey[600]!);
        } else {
          border = Border.all(width: 1.2, color: Colors.grey[300]!);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: border,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
      duration: 200.milliseconds,
      child: Row(
        children: [
          widget.leftWidget ?? Container(),
          Expanded(
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: black,
              ),
              controller: widget.controller,
              focusNode: focus,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
                isDense: true,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
