 import 'package:drboot/firebase_options.dart';
import 'package:drboot/layout/home_layout.dart';
import 'package:drboot/modules/login/login_screen.dart';
 import 'package:drboot/modules/register/cubit/cubit.dart';
 import 'package:drboot/onBoard.dart';
import 'package:drboot/shared/cubit/cubit.dart';
import 'package:drboot/shared/cubit/states.dart';
import 'package:drboot/shared/network/local/cache_helper.dart';
import 'package:drboot/shared/network/remote/dio_helper.dart';
import 'package:drboot/shared/styles/themes.dart';
import 'package:drboot/test.dart';
 import 'package:firebase_core/firebase_core.dart';
 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shared/componant/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

  DioHelper.init();

  Widget? widget;
  uId = CacheHelper.getData(key: 'uId');

  if (onBoarding != null) {
    if (uId != null) {
      widget = HomeLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = onBoardScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  const MyApp({

    this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Appcubit()),
        BlocProvider(create: (context) => RegisterCubit()),
      ],
      child: BlocConsumer<Appcubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(414, 896),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                  useInheritedMediaQuery: true,
                  debugShowCheckedModeBanner: false,
                  theme: themeData,
                  home: LoginScreen());

            },
          );
        },
      ),
    );
  }
}
