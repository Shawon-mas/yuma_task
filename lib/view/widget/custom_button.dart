import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuma_task/view/widget/text_widget.dart';
class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const CustomButton({
    super.key, required this.buttonText, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 3, left: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border(
            bottom: BorderSide(color: Colors.black),
            top: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
          )
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 50,
        onPressed: onPressed,
        color: Colors.yellow.withOpacity(0.8),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
        ),
        child: TextWidget(
          value: buttonText,
          textColor: Colors.black,
          fontWeight: FontWeight.w700,
          size: 18.sp,
        ),
      ),
    );
  }
}