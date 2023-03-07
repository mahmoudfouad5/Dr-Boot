import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drboot/modules/chat_boot.dart';
import 'package:drboot/modules/with/lab_with.dart';
import 'package:drboot/shared/componant/components.dart';
import 'package:drboot/shared/cubit/cubit.dart';
import 'package:drboot/shared/cubit/states.dart';
import 'package:drboot/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class ConfirmScreen extends StatefulWidget {
  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  var formkey = GlobalKey<FormState>();

  int selectedIndex = -1;

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
                            padding: EdgeInsets.only(top: 130.0.h),
                            child: Align(
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  color: defaultColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => buildLab(index),
                        itemCount: 3,
                        scrollDirection: Axis.vertical,
                      ),
                      defualtButton(onPressed: (){}, text: "Confirm", background: defaultColor,width: 130.w,height: 50.h)
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

  Widget buildLab(int index) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(25.0.w),
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
                width: 20.w,
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
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.green,
                  size: 30.w,
                ),
              ),
              SizedBox(
                width: 10.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
