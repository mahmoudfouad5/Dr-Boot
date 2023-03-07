import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:drboot/models/user_model.dart';
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

import '../../models/doctor_model.dart';

class DoctorWith extends StatefulWidget {
  @override
  State<DoctorWith> createState() => _DoctorWithState();
}

class _DoctorWithState extends State<DoctorWith> {
  var titlecontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var cubit = Appcubit.get(context);
    UserData? model;
    bool isBottomSheetExpanded = false;

    return BlocConsumer<Appcubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(

          key: scaffoldKey,
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
                                "Doctors",
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
                              child: BuildCondition(
                                condition: state is! CreateDoctorWithLoadingState,
                                builder: (context) => BuildCondition(
                                    condition: cubit.doctorData.length > 0,
                                    builder: (context) => ListView.builder(
                                      itemBuilder: (context, index) =>
                                          buildDoctor(cubit.doctorData[index], context,index),
                                      itemCount: cubit.doctorData.length,
                                    ),
                                    fallback: (context) => Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "please add your courses",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black.withOpacity(.4)),
                                          )
                                        ],
                                      ),
                                    )),
                                fallback: (context) => Center(child: CircularProgressIndicator()),
                              ),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Visibility(
              visible: cubit.model!.isAdmin!,
              child: FloatingActionButton(
                backgroundColor: HexColor("#314160"),
                onPressed: () {
                  showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                       children: [
                         SizedBox(height: 10.h,),
                         defualtTextFormField(controller: titleController, label: "name", prefixIcon: Icons.person,
                             validate: (String? value) {
                               if (value!.isEmpty) {
                                 return "password is too short ";
                               }
                             }),
                         SizedBox(height: 10,),
                         Padding(
                           padding:   EdgeInsets.all(8.0.h),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               AnimatedButton(
                                 isFixedHeight: false,
                                 width: 75.w,
                                 text: 'Add',
                                 pressEvent: () {
                                   if (formKey.currentState!.validate()) {
                                     cubit.DoctorWithCreate(
                                       name:titlecontroller.text ,
                                       age: 10,
                                       info: "21",
                                       photo: "512",
                                     );
                                     titlecontroller.text = '';
                                   }
                                   cubit.getDoctorWithData();
                                 },
                               ),
                               SizedBox(
                                 width: 15.w,
                               ),
                               AnimatedButton(
                                 isFixedHeight: false,
                                 color: Colors.red,
                                 width: 75.w,
                                 text: 'Close',
                                 pressEvent: () {
                                 },
                               )
                             ],
                           ),
                         ),

                         SizedBox(height: 400.h,),


                       ],
                    );

                  },);
                  // late AwesomeDialog dialog;
                  // dialog = AwesomeDialog(
                  //   context: context,
                  //   animType: AnimType.SCALE,
                  //   dialogType: DialogType.INFO,
                  //   keyboardAware: true,
                  //   body: Padding(
                  //     padding:   EdgeInsets.all(8.0.h),
                  //     child: Form(
                  //       key: formKey,
                  //       child: Column(
                  //         children: <Widget>[
                  //           Text(
                  //             'Enter Course Name',
                  //             style: Theme.of(context).textTheme.headline6,
                  //           ),
                  //             SizedBox(
                  //             height: 5.h,
                  //           ),
                  //           Material(
                  //             elevation: 0,
                  //             child: TextFormField(
                  //               controller: titlecontroller,
                  //               validator: (context) {
                  //                 if (context!.isEmpty) {
                  //                   return "You Must Add Title Name";
                  //                 }
                  //               },
                  //               autofocus: true,
                  //               minLines: 1,
                  //               maxLines: 2,
                  //               decoration: InputDecoration(
                  //                 fillColor: Colors.black.withAlpha(40),
                  //                 border: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.circular(15),
                  //                 ),
                  //                 labelText: 'Title',
                  //                 prefixIcon: Icon(Icons.text_fields),
                  //               ),
                  //             ),
                  //           ),
                  //             SizedBox(
                  //             height: 5.h,
                  //           ),
                  //             SizedBox(
                  //             height: 5.h,
                  //           ),
                  //           Padding(
                  //             padding:   EdgeInsets.all(8.0.h),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 AnimatedButton(
                  //                   isFixedHeight: false,
                  //                   width: 75.w,
                  //                   text: 'Add',
                  //                   pressEvent: () {
                  //                     if (formKey.currentState!.validate()) {
                  //                       cubit.DoctorWithCreate(
                  //                         name:titlecontroller.text ,
                  //                         age: 10,
                  //                         info: "21",
                  //                         photo: "512",
                  //                       );
                  //                       titlecontroller.text = '';
                  //                       dialog.dismiss();
                  //                     }
                  //                     cubit.getDoctorWithData();
                  //                   },
                  //                 ),
                  //                 SizedBox(
                  //                   width: 15.w,
                  //                 ),
                  //                 AnimatedButton(
                  //                   isFixedHeight: false,
                  //                   color: Colors.red,
                  //                   width: 75.w,
                  //                   text: 'Close',
                  //                   pressEvent: () {
                  //                     dialog.dismiss();
                  //                   },
                  //                 )
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )..show();
                },
                child: Icon(Icons.add),
              )),
        );
      },
    );
  }



  Widget buildDoctor(DoctorData data, context,int index) {
    return Container(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: 25.0.w, top: 25.h, bottom: 25.h, left: 100.w),
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
                          Text("${data.info}"),
                          Text("${data.name}"),
                          Text("${data.age}"),
                          Text("${data.photo}"),
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
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: CircleAvatar(
              backgroundColor: HexColor("#5AACB0"),
              radius: 55.r,
            ),
          ),
        ],
      ),
    );
  }
}
