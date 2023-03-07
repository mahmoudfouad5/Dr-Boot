

import 'package:drboot/modules/login/login_screen.dart';
import 'package:drboot/shared/componant/components.dart';
import 'package:drboot/shared/network/local/cache_helper.dart';

void singOut(context){
  CacheHelper.removeData(key: "uId").then((value){
    if(value!){
      navigatorToReplacement(context,  LoginScreen());


    }
  }) ;

}
String ? uId ;
