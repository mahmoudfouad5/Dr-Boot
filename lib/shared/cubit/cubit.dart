import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drboot/models/doctor_model.dart';
import 'package:drboot/models/user_model.dart';
import 'package:drboot/modules/login/login_screen.dart';
import 'package:drboot/shared/componant/components.dart';
import 'package:drboot/shared/componant/constant.dart';
import 'package:drboot/shared/cubit/states.dart';
import 'package:drboot/shared/network/local/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class Appcubit extends Cubit<AppStates> {
  Appcubit() : super(AppInitialState());

  static Appcubit get(context) => BlocProvider.of(context);


  bool isChecked = false ;
  UserData? model;

  final imagepicker = ImagePicker();
  File? image;
  UploadImage() async {
    var pickedImage = await imagepicker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      emit(pickedImageSuccessfulState());
      image = File(pickedImage.path);
    }
  }
  final imagepickerRegster = ImagePicker();
  File? imageRegster;
  UploadImageRegster() async {
    var pickedImage = await imagepickerRegster.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      emit(pickedImageSuccessfulState());
      imageRegster = File(pickedImage.path);
    }
  }

  bool _isDark = false;
  bool get isDark => _isDark;
  void changeTheme() {
    _isDark = !_isDark;

    // Emit will change the state of our theme (Must use)
    emit(isCheckedState());
  }

  void singOut(context) {
    CacheHelper.removeData(key: "uId").then((value) {
      emit(AppSingOutState());
      if (value!) {
        navigatorToReplacement(context, LoginScreen());
      }
      print(value);
    });
  }

  void DoctorWithCreate({
    @required String? name,
    @required int? age,
    @required String? info,
    @required String? photo,
  }) {
    DoctorData  doctorWithDate = DoctorData(
      name: name,
      age: age,
      info: info,
      photo: photo,

     );

    emit(CreateDoctorWithLoadingState());

    FirebaseFirestore.instance
        .collection('doctorWith/drBoot/doctors')
        .add(doctorWithDate.toMap())
        .then((value) {
      String? Successmassege = "doctor Added";

      emit(CreateDoctorWithSuccessState(Successmassege));
    }).catchError((error) {
      print(error.toString());
      emit(CreateDoctorWithErrorState(error.toString()));
    });
  }
  List<DoctorData> doctorData = [];

  void getDoctorWithData() {
    emit(GetDataLoadingState());

    FirebaseFirestore.instance
        .collection("doctorWith/drBoot/doctors")
        .get()
        .then((value) {
      doctorData = [];
      value.docs.forEach((element) {
        doctorData.add(DoctorData.fromJson(element.data()));
      });
      emit(GetDataDoctorWithSuccessState());
    }).catchError((error) {
      emit(GetDataDoctorWithErrorState(error.toString()));
    });
  }

  var user;
  void getUserdata() {
    FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {
       user = value;

      model = UserData.fromJson(value.data()!);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserDataErrorState(error.toString()));
    });
  }






}
