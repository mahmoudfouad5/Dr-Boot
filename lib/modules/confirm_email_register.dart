import 'dart:async';

import 'package:drboot/modules/confirm_register.dart';
import 'package:drboot/modules/register/cubit/states.dart';
import 'package:drboot/shared/componant/components.dart';
import 'package:drboot/shared/network/local/cache_helper.dart';
import 'package:drboot/shared/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'register/cubit/cubit.dart';

class ConfirmEmailRegister extends StatefulWidget {
  @override
  State<ConfirmEmailRegister> createState() => _ConfirmEmailRegisterState();
  ConfirmEmailRegister({required this.name , required this.email});

  final String name;
  final String email;

}

class _ConfirmEmailRegisterState extends State<ConfirmEmailRegister> {
  bool isEmailVerified = false   ;
  bool isActive = true   ;

  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //user needs to be created before
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 5),
            (_) => checkEmailVerified(),
      );
    }
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      showToast(
        message: e.toString(),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    //call after email verification
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      showToast(message: "Register Successful ", state: ToastStates.SUCCESS);
      CacheHelper.saveData(
          key: "uId", value: FirebaseAuth.instance.currentUser!.uid);
      FirebaseAuth.instance.currentUser!.uid;
      timer?.cancel();
      navigatorToReplacement(context, ConfirmRegister(name: widget.name.toString(),));

    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);

    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor,
          ),
          body:  SafeArea(

            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 10.h,),
                          Text(
                            "Hello",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: defaultColor),
                          ),
                          Text(
                            widget.name.toString(),
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: defaultColor),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Image.asset("assets/images/email-marketing.png",width: 250.w,),
                          SizedBox(
                            height: 23.h,
                          ),

                          SizedBox(
                            height: 23.h,
                          ),
                          Text("Confirm Your Email Address",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.sp)),
                          SizedBox(
                            height: 25.h,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 59.0.w),
                            child: Text(
                              "We Sent a Confirmation Email to :",
                              style: TextStyle(fontSize: 16.5.sp),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(widget.email,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp)),
                          SizedBox(
                            height: 25.h,
                          ),


                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 59.0.w),
                            child: Text(
                              "Check Your Email And Click On The Confirmation Link to Continue . ",
                              style: TextStyle(fontSize: 16.5.sp),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if(!isActive)
                  Text(" Email Has been sented agin"),
                SizedBox(height: 5.h,),

                defualtButton(
                    onPressed: () {
                      if(isActive){
                        setState(() {
                          isActive = !isActive ;
                        });
                        sendVerificationEmail() ;

                      }
                    },
                    text: "Resent Email",
                    background: isActive ? defaultColor :Colors.grey,
                    height: 60.h,
                    width: 364.w,
                    radius: 29.r,
                    fontSize: 18.sp),
                SizedBox(
                  height: 45.h,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
