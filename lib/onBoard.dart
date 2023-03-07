import 'package:drboot/modules/login/login_screen.dart';
import 'package:drboot/shared/componant/components.dart';
import 'package:drboot/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class onBoardScreen extends StatefulWidget {
  const onBoardScreen({Key? key}) : super(key: key);

  @override
  State<onBoardScreen> createState() => _onBoardScreenState();
}

class _onBoardScreenState extends State<onBoardScreen> {
  var boardController = PageController();

  void submit() {
    CacheHelper.saveData(key: "onBoarding", value: true).then((value) {
      if (value!) {
         navigatorToReplacement(context, LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#EAEAEA"),
        body: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/images/shape.png"),
                alignment: Alignment.topLeft,
                width: double.infinity,
                height: 220.h,

              ),

              Text(
                "DR BOOT",
                style: TextStyle(
                  color: HexColor("#4AA5AA"),
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(
                height: 59.h,
              ),
              Image(
                image: AssetImage("assets/images/undraw_appreciation_re_6k7g 1.png"),
                width: 200.w,
                height: 200.h,
              ),
              Image(
                image: AssetImage("assets/images/line-hart.png"),
                width: 246.w,
                height: 140.h,
              ),
              Text("For a happy healthy smile ,\n we care about your life",style: TextStyle(fontSize: 13.sp),),
              SizedBox(height: 4.h,),

              Image(image: AssetImage("assets/images/Rectangle 10 (1).png",),alignment: Alignment.bottomCenter,height: 160.h,)
            ],
          ),
        ),
        floatingActionButton: Container(
          width: 120.w,
          height: 120.h,
          child: FloatingActionButton(
            onPressed: () {
              submit();


            },
            child: Text(
              "  Get \n Start",
              style: TextStyle(fontSize: 18),
            ),
            backgroundColor: HexColor("#4AA5AA"),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
