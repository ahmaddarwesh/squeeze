import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:supercharged/supercharged.dart';

import 'custom_text.dart';

class CTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final Widget? leftWidget;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputAction? textInputAction;
  final Function(String text)? onChange;
  final String? Function(String? data)? validator;

  const CTextField({
    Key? key,
    this.hint,
    this.controller,
    this.leftWidget,
    this.textInputType,
    this.textInputFormatter,
    this.textInputAction,
    this.onChange,
    this.validator,
  });

  @override
  _CTextFieldState createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: black,
      ),
      onChanged: widget.onChange,
      validator: widget.validator,
      keyboardType: widget.textInputType,
      inputFormatters: widget.textInputFormatter,
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints.loose(Size.fromHeight(50)),
        prefixIcon: widget.leftWidget,
        hintText: widget.hint,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        errorStyle: TextStyle(
          height: 0.0,
          color: Colors.transparent,
          fontSize: 12.sp,
        ),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          height: 1.0,
          fontWeight: FontWeight.w500,
          color: Colors.grey[400],
        ),
        isDense: true,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: Colors.grey[600]!,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
