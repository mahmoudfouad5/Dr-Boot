import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drboot/modules/chat_boot.dart';
import 'package:drboot/modules/with/doctor_with.dart';
import 'package:drboot/modules/without/doctor_without.dart';
import 'package:drboot/shared/componant/components.dart';
import 'package:drboot/shared/cubit/cubit.dart';
import 'package:drboot/shared/cubit/states.dart';
import 'package:drboot/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = Appcubit.get(context);

    return BlocConsumer<Appcubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Image(
                                image: AssetImage("assets/images/shape.png"),
                                alignment: Alignment.topLeft,
                                width: double.infinity,
                                height: 200.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 25.0.h),
                                child: Align(
                                  alignment: Alignment(-.99.w, -74.h),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.arrow_back,
                                        color: HexColor("#4AA5AA"), size: 30.h),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 25.0.h),
                                child: Align(
                                  alignment: Alignment(-.75.w, -74.h),
                                  child: IconButton(
                                    onPressed: () {
                                    },
                                    icon: Icon(Icons.wrap_text_sharp,
                                        color: Colors.white, size: 30.h),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Image(
                            image: AssetImage(
                                "assets/images/WhatsApp Image 2022-12-31 at 19.41 1.png"),
                            alignment: Alignment.topLeft,
                            width: 359.w,
                            height: 353.h,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 59.0.w),
                            child: Text( "information about suggestions disease about his symptoms",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),


                defualtButton(
                    onPressed: () {
                      navigatorTo(context, DoctorWithOut());
                    },
                    text: "CON DOCTOR",
                    background: defaultColor,
                    height: 60.h,
                    width: 364.w,
                    radius: 29.r,
                    fontSize: 18.sp),
                SizedBox(height: 25.h,),
              ],
            ),
          ),
        );
      },
    );
  }
}
