import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drboot/modules/chat_boot.dart';
import 'package:drboot/shared/componant/components.dart';
import 'package:drboot/shared/componant/constant.dart';
import 'package:drboot/shared/cubit/cubit.dart';
import 'package:drboot/shared/cubit/states.dart';
import 'package:drboot/shared/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeLayout extends StatefulWidget {

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
    @override
  Widget build(BuildContext context) {
    var cubit = Appcubit.get(context) ;

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
                            alignment: Alignment.topRight,
                            children: [

                              Image(
                                image: AssetImage("assets/images/shape.png"),
                                alignment: Alignment.topLeft,
                                width: double.infinity,
                                height: 200.h,
                              ),
                              IconButton(
                                  onPressed: () {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.WARNING,
                                      headerAnimationLoop: false,
                                      animType: AnimType.TOPSLIDE,
                                      showCloseIcon: true,
                                      closeIcon: const Icon(Icons.close),
                                      title: 'Warning',
                                      desc: 'Are You Sure , Do You Want To Logout?',
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {
                                        Appcubit.get(context).singOut(context);
                                      },
                                    ).show();
                                  },
                                  icon: Icon(
                                    Icons.logout,
                                    size: 30,
                                  )),

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
                            child: Text(
                              "myocardial infarction happens when one or "
                              "more areas of the heart muscle don't get enough oxygen."
                              " This happens when blood flow to the heart"
                              " muscle is blocked ",
                              style: TextStyle(fontSize: 14.5.sp),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                defualtButton(
                    onPressed: () {
                      navigatorTo(context, ChatBoot());
                      cubit.getUserdata();
                      setState(() {
                       });
                    },
                    text: "Check me",
                    background: defaultColor,
                    height: 60.h,
                    width: 364.w,
                    radius: 29.r,
                    fontSize: 18.sp),
                SizedBox(height: 5.h,)

              ],
            ),
          ),
        );
      },
    );
  }
}
