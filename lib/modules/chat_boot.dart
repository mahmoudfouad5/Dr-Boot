import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drboot/modules/result_with.dart';
import 'package:drboot/shared/componant/components.dart';
import 'package:drboot/shared/cubit/cubit.dart';
import 'package:drboot/shared/cubit/states.dart';
import 'package:drboot/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class ChatBoot extends StatefulWidget {
  @override
  State<ChatBoot> createState() => _ChatBootState();
}

class _ChatBootState extends State<ChatBoot> {
  @override
  Widget build(BuildContext context) {
    var cubit = Appcubit.get(context);
    var formkey = GlobalKey<FormState>();


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
                  defualtButton(
                      onPressed: () {},
                      text: "Chat a",
                      background: defaultColor,
                      height: 45.h,
                      width: 185.w,
                      radius: 29.r,
                      fontSize: 18.sp),
                  SizedBox(
                    height: 40.h,
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: defaultColor.withOpacity(.32),
                          borderRadius: BorderRadius.circular(25.r),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ], // changes position of shadow
                        ),
                        width: 350.w,
                        height: 250.h,
                        child: Padding(
                          padding:  EdgeInsets.all(8.0.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 14.h,
                              ),
                              Container(
                                width: 74.w,
                                height: 9.h,
                                decoration: BoxDecoration(
                                    color: HexColor("#535353B0").withOpacity(.69),
                                    borderRadius: BorderRadius.circular(25.r)),
                              ),
                              Expanded(
                                child: ListView(
                                  children: [
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                    Text(
                                      "datadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 33.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: defaultColor.withOpacity(.32),
                          borderRadius: BorderRadius.circular(25.r),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ], // changes position of shadow
                        ),
                        width: 163.w,
                        height: 173.h,
                        child: cubit.image == null
                            ? Text("")
                            : Padding(
                              padding:  EdgeInsets.all(5.0.r),
                              child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.r),
                                  child: Image.file(cubit.image!,
                                      fit: BoxFit.fill)),
                            ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.all(30.0.w),
                        child: defualtButton(
                            onPressed: () {
                              cubit.UploadImage();
                            },
                            text: "Upload eco image",
                            background: defaultColor),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  defualtButton(
                      onPressed: () {
                        // navigatorTo(context, ResultWith());
                        if ( cubit.image != null) {
                           navigatorTo(context, ResultWith());
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
                                      'Please choose a image first',
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
                      text: "See Result ",
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
