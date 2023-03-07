import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drboot/modules/chat_boot.dart';
import 'package:drboot/modules/confirm.dart';
import 'package:drboot/shared/componant/components.dart';
import 'package:drboot/shared/cubit/cubit.dart';
import 'package:drboot/shared/cubit/states.dart';
import 'package:drboot/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class HospitalWithOut extends StatefulWidget {
  @override
  State<HospitalWithOut> createState() => _HospitalWithOutState();
}

class _HospitalWithOutState extends State<HospitalWithOut> {
  int selectedIndex = -1;
  var formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
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
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.wrap_text_sharp,
                                    color: Colors.white, size: 30.h),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 130.0.h),
                            child: Align(
                              child: Text("Hospital",style: TextStyle(
                                fontSize: 25.sp,
                                color: defaultColor,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),

                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                              width: double.infinity,
                              height: 650.h,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image:
                                    AssetImage("assets/images/two-doctor.png"),
                                fit: BoxFit.fitHeight,
                                opacity: .5,
                              )),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        color: Colors.white30,
                                        child: ListView.builder(
                                          itemCount: 5,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                if (index == selectedIndex) {
                                                  selectedIndex = -1;
                                                } else {
                                                  selectedIndex = index;
                                                }

                                                setState(() {});
                                              },
                                              child: buildHospital(index),
                                            );
                                          },
                                        )),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 230.h,
                                        child: Padding(
                                          padding: EdgeInsets.all(7.0.h),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25.r),
                                                color: Colors.grey[500],
                                              ),
                                              width: 80.w,
                                              height: 7.h,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: .50,
                                              offset: Offset(
                                                1,
                                                -.8,
                                              ),
                                            ),
                                          ],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.r),
                                              topRight: Radius.circular(30.r)),
                                          color: HexColor("#D5ECED"),
                                        ),
                                      ),
                                      defualtButton(
                                          onPressed: () {
                                            if (selectedIndex > 0) {
                                              navigatorTo(context, ConfirmScreen());
                                            } else {
                                              late AwesomeDialog dialog;
                                              dialog = AwesomeDialog(
                                                context: context,
                                                animType: AnimType.SCALE,
                                                dialogType: DialogType.INFO,
                                                keyboardAware: true,
                                                body: Padding(
                                                  padding:
                                                  EdgeInsets.all(8.0.w),
                                                  child: Form(
                                                    key: formkey,
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text(
                                                          'Please choose a Hospital first',
                                                          style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .headline6,
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.all(
                                                              8.0.w),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              AnimatedButton(
                                                                isFixedHeight:
                                                                false,
                                                                color:
                                                                defaultColor,
                                                                width: 75.w,
                                                                text: 'Close',
                                                                pressEvent: () {
                                                                  dialog
                                                                      .dismiss();
                                                                },
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )..show();
                                            }
                                          },
                                          text: "Next",
                                          background: defaultColor,
                                          height: 60.h,
                                          width: 364.w,
                                          radius: 29.r,
                                          fontSize: 18.sp),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildHospital(int index) {
    return Container(
      child: Padding(
        padding:   EdgeInsets.all(25.0.w),
        child: Container(
          width: double.infinity,
          height: 128.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1.50,
                spreadRadius: .8,
                offset: Offset(
                  -.8,
                  1,
                ),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            color: HexColor("#C7DBDC"),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 69.w,
              ),
              Expanded(
                  child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text("data"),
                      Text("data"),
                      Text("data"),
                      Text("data"),
                      Text("data"),
                    ],
                  ),
                ],
              )),
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 12.r,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                      radius: 10.r,
                      backgroundColor: (index == selectedIndex)
                          ? HexColor("#1FE083")
                          : HexColor("#C7DBDC"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
