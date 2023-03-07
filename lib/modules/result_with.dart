import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drboot/modules/result_without.dart';
import 'package:drboot/modules/with/doctor_with.dart';
import 'package:drboot/shared/componant/components.dart';
import 'package:drboot/shared/cubit/cubit.dart';
import 'package:drboot/shared/cubit/states.dart';
import 'package:drboot/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class ResultWith extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = Appcubit.get(context);

    return BlocConsumer<Appcubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
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
                  Text("Result",style: TextStyle(fontSize: 40.sp,color: defaultColor,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 13.h,
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: HexColor("#C7DBDC"),
                          borderRadius: BorderRadius.circular(25.r),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ], // changes position of shadow
                        ),
                        width: 338.w,
                        height: 314.h,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 14.h,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView(
                                    children: [
                                      Text(
                                        "Lorem ipsum dolor sit amet consectetur.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.sp),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text("Now choose your doctor ",style: TextStyle(fontSize: 18.sp ,color: HexColor("#0809096E").withOpacity(.43)),),
                  SizedBox(
                    height: 50.h,
                  ),
                  defualtButton(
                      onPressed: () {
                        navigatorTo(context, DoctorWith());
                      },
                      text: "Check Doctors ",
                      background: defaultColor,
                      height: 60.h,
                      width: 364.w,
                      radius: 29.r,
                      fontSize: 18.sp)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
