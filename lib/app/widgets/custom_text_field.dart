import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squeeze/app/theme/app_colors.dart';

class CTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final Widget? leftWidget;
  final double? height;
  final int? maxLine;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputAction? textInputAction;
  final Function(String text)? onChange;
  final String? Function(String? data)? validator;
  final bool readOnly;

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
    this.height,
    this.readOnly = false,
    this.maxLine,
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
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        maxLines: widget.maxLine,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: black,
        ),
        onChanged: widget.onChange,
        readOnly: widget.readOnly,
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
            vertical: 13,
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
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.2,
              color: Colors.grey[300]!,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.2,
              color: Colors.grey[600]!,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.2,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.2,
              color: Colors.grey[300]!,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
