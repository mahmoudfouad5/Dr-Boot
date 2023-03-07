import 'dart:async';

import 'package:buildcondition/buildcondition.dart';
import 'package:drboot/layout/home_layout.dart';
import 'package:drboot/modules/confirm_email_register.dart';
 import 'package:drboot/modules/register/cubit/cubit.dart';
import 'package:drboot/modules/register/cubit/states.dart';
import 'package:drboot/shared/componant/components.dart';
import 'package:drboot/shared/componant/constant.dart';
import 'package:drboot/shared/network/local/cache_helper.dart';
import 'package:drboot/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var nameController = TextEditingController();

  final phoneController = TextEditingController();
  String verificationID = "";

  var verifiedPasswordController = TextEditingController();
  bool showLoading = false;
  String verificationFailedMessage = "";

  bool isObscure = true;
  bool isPicked = false;
  @override
  String? _now;
  Timer? _everySecond;

  @override
  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is CreateUserSuccessState) {
            navigatorTo(context, ConfirmEmailRegister(name: nameController.text, email: emailController.text,));
          }

          if (state is RegisterErrorState) {
            showToast(message: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: defaultScaffoldColor,
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Image(
                              image: AssetImage("assets/images/shape.png"),
                              alignment: Alignment.topLeft,
                              width: double.infinity,
                              height: 235.h,
                            ),

                            Padding(
                              padding:  EdgeInsets.only(top: 25.0.h),
                              child: Align(

                                alignment: Alignment(-.99.w,-74.h),
                              child:IconButton(onPressed: (){
                                Navigator.pop(context);
                              }, icon: Icon(Icons.arrow_back ,color: HexColor("#4AA5AA"),size:30.h ),) ,

                              ),
                            )
                          ],

                        ),
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp,
                              color: defaultColor,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Image(
                          image: AssetImage("assets/images/line-hart.png"),
                          alignment: Alignment.center,
                          width: 246.w,
                          height: 144.h,
                        ),


                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                          child: defualtTextFormField(
                              controller: nameController,
                              label: "Name ",
                              keyboardType: TextInputType.name,
                              prefixIcon:
                                  Icons.drive_file_rename_outline_outlined,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return "name must be not Empty ";
                                }
                              }),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
                          child: defualtTextFormField(
                              controller: emailController,
                              label: "Email Address",
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Icons.email_outlined,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return "Email must be not Empty ";
                                }
                              }),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                          child: defualtTextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              label: "Password",
                              prefixIcon: Icons.lock,
                              isobscureText:
                                  RegisterCubit.get(context).isPasswordShow,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    RegisterCubit.get(context).ChangeObscuer();
                                  },
                                  icon: Icon(RegisterCubit.get(context).suffix)),
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return "password is too short ";
                                }
                              }),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                          child: defualtTextFormField(
                              controller: verifiedPasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              label: "confirm password",
                              prefixIcon: Icons.lock,
                              isobscureText:
                                  RegisterCubit.get(context).isRePasswordShow,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    RegisterCubit.get(context).ChangeReObscuer();
                                  },
                                  icon: Icon(RegisterCubit.get(context).suffix)),
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return "password is too short ";
                                }
                                if (passwordController.text !=
                                    verifiedPasswordController.text) {
                                  return "password No\'t matching";
                                }
                              }),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        BuildCondition(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => defualtButton(
                              width: 364.w,
                              height: 60.h,
                              radius: 25.r,
                              background: defaultColor,
                              textColor: HexColor("#FFFFFF"),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  print(uId);
                                  setState(() {
                                    RegisterCubit.get(context).userRegister(

                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text,
                                        phone: phoneController.text,
                                         isAdmin: false,
                                         profileImage: "https://simg.nicepng.com/png/small/128-1280406_view-user-icon-png-user-circle-icon-png.png");

                                  });

                                  FocusScope.of(context).unfocus();
                                }
                              },
                              text: "Register",
                              fontSize: 20.sp),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              "Already have an account ? ",
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.black),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "sign in",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: defaultColor),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
