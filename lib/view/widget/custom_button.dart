import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuma_task/view/widget/text_widget.dart';
class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? color;
  final bool isLoading;
  const CustomButton({
    super.key, required this.buttonText, required this.onPressed, this.color,  this.isLoading=false,
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
        color: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
        ),
        child:isLoading
            ?Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  value: 'Please Wait...',
                  textColor: Colors.red.withOpacity(0.5),
                  fontWeight: FontWeight.w700,
                  size: 18.sp,
                ),
                SizedBox(width: 10.w,),
                SizedBox(height:30.h,width:30.w ,child: CircularProgressIndicator(color: Colors.red.withOpacity(0.5),)),
              ],
            ),)
            : TextWidget(
          value: buttonText,
          textColor: Colors.black,
          fontWeight: FontWeight.w700,
          size: 18.sp,
        ),
      ),
    );
  }
}