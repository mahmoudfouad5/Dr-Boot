import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drboot/models/user_model.dart';
import 'package:drboot/modules/register/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  // LoginModel ? loginModel ;

  bool isPasswordShow = true;

  bool isOpen = true;

  bool isRePasswordShow = true;

  UserData model = UserData();

  IconData suffix = Icons.remove_red_eye_outlined;

  void ChangeObscuer() {
    isPasswordShow = !isPasswordShow;
    suffix =
        isPasswordShow ? Icons.remove_red_eye_outlined : Icons.visibility_off;
    emit(RegisterChangeSuffixIcon());
  }

  void ChangeReObscuer() {
    isRePasswordShow = !isRePasswordShow;
    suffix =
        isRePasswordShow ? Icons.remove_red_eye_outlined : Icons.visibility_off;
    emit(RegisterChangeSuffixIcon());
  }

  void userCreate({
    @required String? email,
    @required String? profileImage,
    @required String? password,
    @required String? name,
    @required String? phone,
    @required String? uId,
    @required bool? isAdmin,
  }) {
    UserData model = UserData(
      name: name,
      profileImage: profileImage,
      phone: phone,
      password: password,
      email: email,
      uId: uId,
      isAdmin: isAdmin,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState(uId));
    }).catchError((error) {
      print(error.toString());
      emit(CreateUserErrorState(error.toString()));
    });
  }

  void userRegister({
    @required String? email,
    @required String? password,
    @required String? name,
    @required String? phone,
    @required bool? isAdmin,
    @required String? profileImage,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
      emit(RegisterSuccessState());
      userCreate(
        email: email,
        password: password,
        name: name,
        phone: phone,
        isAdmin: isAdmin,
        profileImage: profileImage,
        uId: value.user!.uid,
      );
     }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void EmailVerified(){
    String uId = model.uId.toString() ;
    emit(ConfirmEmailRegisterSuccessState(uId));

  }
}
