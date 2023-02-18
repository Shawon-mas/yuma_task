import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:yuma_task/view/screen/auth/sign_in_screen.dart';
import '../../../controller/auth_controller.dart';
import '../../../utilites/global_constants.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/text_widget.dart';

class SignUpScreen extends StatelessWidget {
  final controller = Get.put(AuthController());
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30.h,),
            Align(
              alignment: Alignment.topLeft,
              child: TextWidget(
                value: 'Sign Up',
                textColor: Colors.black,
                fontWeight: FontWeight.w700,
                size: 28.sp,
              ),
            ),
            SizedBox(height: 10.h,),
            Hero(
              tag: 'auth',
              child:Lottie.asset('assets/icons/loginlottie.json'),
            ),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4,
                              offset: Offset(2,2),
                              spreadRadius:0
                          )
                        ]
                    ),
                    child: CustomTextField(
                      prefixIcon: FontAwesomeIcons.user,
                      hintText: 'First name',
                      controller: controller.firstNameSignUpController,
                      focusNode: controller.firstNameSignUpFocus,
                      nextFocus: controller.lastNameSignUpFocus,
                      inputType: TextInputType.text,
                      maxLines: 1,

                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4,
                              offset: Offset(2,2),
                              spreadRadius:0
                          )
                        ]
                    ),
                    child: CustomTextField(
                      prefixIcon: FontAwesomeIcons.user,
                      hintText: 'Last name',
                      controller: controller.lastNameSignUpController,
                      focusNode: controller.lastNameSignUpFocus,
                      nextFocus: controller.emailSignUpFocus,
                      inputType: TextInputType.text,

                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 10.h,),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: Offset(2,2),
                        spreadRadius:0
                    )
                  ]
              ),
              child: CustomTextField(
                prefixIcon: FontAwesomeIcons.message,
                hintText: 'Email',
                controller: controller.emailSignUpController,
                focusNode: controller.emailSignUpFocus,
                nextFocus: controller.userSignUpFocus,
                inputType: TextInputType.text,

              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: Offset(2,2),
                        spreadRadius:0
                    )
                  ]
              ),
              child: CustomTextField(
                prefixIcon: FontAwesomeIcons.userLarge,
                hintText: 'Username',
                controller: controller.userSignUpController,
                focusNode: controller.userSignUpFocus,
                nextFocus: controller.passwordSignUpFocus,
                inputType: TextInputType.text,


              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: Offset(2,2),
                        spreadRadius:0
                    )
                  ]
              ),
              child: CustomTextField(
                prefixIcon: FontAwesomeIcons.lock,
                hintText: 'Password',
                controller: controller.passwordSignUpController,
                focusNode: controller.passwordSignUpFocus,
                inputAction: TextInputAction.done,
                inputType: TextInputType.visiblePassword,
                isPassword: true,
              ),
            ),
            SizedBox(height: 30.h,),
            Obx(() => CustomButton(
              isLoading: controller.isSignUpDone.value,
              buttonText: 'Sign Up',
              color: Colors.yellow.withOpacity(0.7),
              onPressed: (){
                controller.checkSignUpTextField(context);
              },
            ),),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                TextWidget(
                  value: "Already Have account?",
                  textColor: Colors.black,
                  fontWeight: FontWeight.w500,
                  size: 16.sp,
                ),
                SizedBox(width: 5.w,),
                TextWidget(
                  onPressed: (){
                    Get.offAll(()=> SignInScreen());
                  },
                  value: "Sign In",
                  textColor: Colors.red.withOpacity(0.7),
                  fontWeight: FontWeight.w700,
                  size: 16.sp,
                ),

              ],),
            SizedBox(height: 20.h,),


          ],
        ),
      ),
    );
  }
}


