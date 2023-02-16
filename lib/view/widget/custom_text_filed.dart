
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function? onChanged;
  final Function? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final IconData? prefixIcon;
  final bool divider;
  final TextAlign textAlign;
  final bool isAmount;
  final bool isNumber;
  final bool showTitle;

  CustomTextField(
      {this.hintText = 'Write something...',
        required this.controller,
        required this.focusNode,
        this.nextFocus,
        this.isEnabled = true,
        this.inputType = TextInputType.text,
        this.inputAction = TextInputAction.next,
        this.maxLines = 1,
        this.onSubmit,
        this.onChanged,
        this.prefixIcon,
        this.capitalization = TextCapitalization.none,
        this.isPassword = false,
        this.divider = false,
        this.textAlign = TextAlign.start,
        this.isAmount = false,
        this.isNumber = false,
        this.showTitle = false,

      });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [



        TextField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textAlign: widget.textAlign,
          style: GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black,),
          textInputAction: widget.inputAction,
          keyboardType: widget.isAmount ? TextInputType.number : widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
              : widget.isAmount ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))] : widget.isNumber ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))] : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.spMin),
              borderSide: BorderSide(style: BorderStyle.none, width: 0),
            ),
            isDense: true,
            hintText: widget.hintText,
            fillColor: Colors.white,
            hintStyle: GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 16.sp, color: Theme.of(context).hintColor),
            filled: true,
            prefixIcon: widget.prefixIcon != null ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Icon(widget.prefixIcon),
            ) : null,
            suffixIcon: widget.isPassword ? IconButton(
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Theme.of(context).hintColor.withOpacity(0.3)),
              onPressed: _toggle,
            ) : null,
          ),
          onSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null ? widget.onSubmit!(text) : null,

        ),

      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
