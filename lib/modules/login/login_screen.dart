import 'package:buildcondition/buildcondition.dart';
import 'package:drboot/layout/home_layout.dart';
import 'package:drboot/modules/confirm_email_register.dart';
import 'package:drboot/modules/login/cubit/cubit.dart';
import 'package:drboot/modules/login/cubit/states.dart';
import 'package:drboot/modules/register/register_screen.dart';
import 'package:drboot/shared/componant/components.dart';
import 'package:drboot/shared/componant/constant.dart';
import 'package:drboot/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            CacheHelper.saveData(key: "uId", value: state.uId).then((value) {
              print(uId);

              navigatorToReplacement(context, HomeLayout());
            });
          }
          if (state is LoginEmailVerifiedState) {
            navigatorTo(  context, ConfirmEmailRegister(name: "Sir", email: emailController.text,));

          }
          if (state is LoginErrorState) {
            showToast(message: state.error, state: ToastStates.ERROR);
            print(state.error);
          }
        },
        builder: (context, state) {
          return  Scaffold(
            resizeToAvoidBottomInset: true,


            backgroundColor: HexColor("#EAEAEA"),
            // appBar: AppBar(
            //     backgroundColor: HexColor("#F8F7F9"),
            // ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: HexColor("##4AA5AA"),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 19).w,
                            child: defualtTextFormField(
                                controller: emailController,
                                label: "Email Address",
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: Icons.email_outlined,
                                reduis: 10.r,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Email must be not Empty ";
                                  }
                                }),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 19.0.w),
                            child: defualtTextFormField(
                                onFieldSubmitted: (value) {},
                                reduis: 25.r,
                                controller: passwordController,
                                label: "Password",
                                prefixIcon: Icons.lock,
                                isobscureText: LoginCubit.get(context).isPasswordShow,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      LoginCubit.get(context).ChangeObscuer();
                                    },
                                    icon: Icon(LoginCubit.get(context).suffix)),
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return "password is too short ";
                                  }
                                }),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Image(
                            image: AssetImage("assets/images/two-doctor.png"),
                            height: 200.h,
                          ),

                          Text(
                            "Forget password ?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: HexColor("#4AA5AA")),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          BuildCondition(
                            condition: state is! LoginLoadingState,
                            builder: (context) => defualtButton(
                              width: 192.w,
                              height: 50.w,
                              radius: 25.r,
                              background: HexColor("##4AA5AA"),
                              textColor: HexColor("#FFFFFF"),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                  FocusScope.of(context).unfocus();
                                }
                              },
                              text: "Sign in",
                              fontSize: 23.sp,
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                            child: Row(
                              children: [
                                Text(
                                  "Don\'t have an account ?",
                                  style: TextStyle(
                                      fontSize: 20.sp, color: Colors.grey[700]),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TextButton(
                                  onPressed: () {
                                    navigatorTo(context, RegisterScreen());
                                  },
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        fontSize: 23.sp, fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
