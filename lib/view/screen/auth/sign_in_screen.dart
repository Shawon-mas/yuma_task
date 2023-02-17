import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:yuma_task/view/screen/auth/sign_up_screen.dart';
import '../../../controller/auth_controller.dart';
import '../../../utilites/global_constants.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/text_widget.dart';

class SignInScreen extends StatelessWidget {
  final controller = Get.put(AuthController());
 SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Center(
           child: Padding(
             padding: const EdgeInsets.all(10.0),
             child: SingleChildScrollView(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(height: 20.h,),
                   Align(
                     alignment: Alignment.topLeft,
                     child: TextWidget(
                       value: 'Sign In',
                       textColor: Colors.black,
                       fontWeight: FontWeight.w700,
                       size: 28.sp,
                     ),
                   ),
                   SizedBox(height: 10.h,),
                   Align(
                     alignment: Alignment.topLeft,
                     child: TextWidget(
                       value: 'Please login your account',
                       textColor: Colors.black.withOpacity(0.5),
                       fontWeight: FontWeight.w700,
                       size: 18.sp,
                     ),
                   ),
                   SizedBox(height: 10.h,),
                   Hero(
                       tag: 'auth',
                       child:Lottie.asset('assets/icons/loginlottie.json'),
                   ),
                   SizedBox(height: 20.h,),
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
                       hintText: 'Email',
                       controller: controller.userSignInController,
                       focusNode: controller.userSignInFocus,
                       nextFocus: controller.passwordSignInFocus,
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
                       controller: controller.passwordSignInController,
                       focusNode: controller.passwordSignInFocus,
                       inputAction: TextInputAction.done,
                       inputType: TextInputType.visiblePassword,
                       isPassword: true,
                     ),
                   ),
                   SizedBox(height: 30.h,),
                   Obx(() => CustomButton(
                     isLoading: controller.isSignInDone.value,
                     buttonText: 'Sign in',
                     color: Colors.yellow,
                     onPressed: (){
                       controller.checkSignInTextField(context);
                     },
                   ),),

                   SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                    TextWidget(
                      value: "Don't Have account?",
                      textColor: Colors.black,
                      fontWeight: FontWeight.w500,
                      size: 16.sp,
                    ),
                      SizedBox(width: 5.w,),
                    TextWidget(
                      onPressed: (){
                        Get.to(()=>SignUpScreen());

                      },
                      value: "Sign Up",
                      textColor: Colors.red.withOpacity(0.7),
                      fontWeight: FontWeight.w700,
                      size: 16.sp,
                    ),

                  ],),
                   SizedBox(height: 20.h,),


                 ],
               ),
             ),
           ),
         ),
    );
  }
}


