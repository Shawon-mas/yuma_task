import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String value;
  final Color? textColor;
  final double size;
  final VoidCallback? onPressed;
  final FontWeight fontWeight;
  final bool isSelecteable;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry edgeInsetsGeometry;

  const TextWidget({
    Key? key,
    required this.value,
    this.textColor,
    this.onPressed,
    this.textAlign,
    this.isSelecteable = false,
    this.edgeInsetsGeometry = const EdgeInsets.all(0),
    required this.size,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsGeometry,
      child: GestureDetector(
        onTap: onPressed,
        child: isSelecteable
            ? SelectableText(
                value,
                style: GoogleFonts.roboto(
                  fontWeight: fontWeight,
                  fontSize: size,
                  color: textColor,
                ),
              )
            : Text(
                value,
                textAlign: textAlign,
                style: GoogleFonts.lato(
                  fontWeight: fontWeight,
                  fontSize: size,
                  color: textColor,
                ),
              ),
      ),
    );
  }
}
