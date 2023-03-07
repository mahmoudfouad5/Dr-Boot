import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drboot/layout/home_layout.dart';
import 'package:drboot/modules/chat_boot.dart';
import 'package:drboot/shared/componant/components.dart';
import 'package:drboot/shared/cubit/cubit.dart';
import 'package:drboot/shared/cubit/states.dart';
import 'package:drboot/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class ConfirmRegister extends StatelessWidget {
  ConfirmRegister({required this.name });
  final String name;


  @override
  Widget build(BuildContext context) {



    var cubit = Appcubit.get(context);

    return BlocConsumer<Appcubit, AppStates>(
      listener: (context, state) {

      },
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
                            ],
                          ),
                          Text(
                            "Hello",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: defaultColor),
                          ),
                          Text(
                              name,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: defaultColor),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            child: cubit.imageRegster == null
                                ? CircleAvatar(
                                    radius: 75.r,
                                    backgroundColor: defaultColor,
                                  )
                                : CircleAvatar(
                                    radius: 75.r,
                                    backgroundImage: FileImage(cubit.imageRegster!,
                                        ),
                                  ),
                          ),
                          SizedBox(
                            height: 23.h,
                          ),
                          defualtButton(
                              onPressed: () {
                                cubit.UploadImageRegster();
                              },
                              text: "choose photo",
                              background: HexColor("#4AA5AA").withOpacity(.24),
                              textColor: Colors.black),
                          SizedBox(
                            height: 23.h,
                          ),
                          Text(
                              "Your\n"
                              "Registeration\n"
                              "successful.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.sp)),
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 59.0.w),
                            child: Text(
                              "Now click next to go check page",
                              style: TextStyle(fontSize: 14.5.sp),
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
                defualtButton(
                    onPressed: () {
                      navigatorToReplacement(context, HomeLayout());
                    },
                    text: "Next",
                    background: defaultColor,
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
