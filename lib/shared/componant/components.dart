import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defualtButton({
  double? width    ,
  double? height,
  double? fontSize,
  Color background = Colors.blue,
  Color textColor = Colors.white,
  @required VoidCallback? onPressed,
  bool isUpperCase = true,
  @required String? text,
  double radius = 5.0,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );

Widget defualtTextFormField({
  @required TextEditingController? controller,
  ValueChanged<String>? onChanged,
  ValueChanged<String>? onFieldSubmitted,
  GestureTapCallback? onTap,
  TextInputType? keyboardType,
  @required String? label,
  @required IconData? prefixIcon,
  Widget? suffixIcon,
  double reduis = 5,
  int? lim ,
  @required FormFieldValidator<String>? validate,
  bool isobscureText = false,
  VoidCallback? suffixPressed,
}) =>
    Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: HexColor("#E1E7EE"),
              blurRadius: 6.r,
              spreadRadius: 3.r,
              offset: Offset(0, 3)),
        ],
        color: HexColor("#FFFFFF"),
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(lim)

        ],
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        onTap: onTap,
        keyboardType: keyboardType,
        validator: validate,
        obscureText: isobscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0.r)),
              borderSide: BorderSide(color: Colors.blue)),
          contentPadding: EdgeInsets.only( left: 35.w,),

          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );

// Widget buildIteamTasks(Map model, context) => Dismissible(
//   key: Key(model['id'].toString()),
//   onDismissed: (direction) {
//     Appcubit.get(context).DeleteDatabase(id: model['id']);
//   },
//   child: Padding(
//     padding: const EdgeInsetsDirectional.only(start: 25, top: 20),
//     child: Container(
//       width: double.infinity,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               // {id: 7, title: u, date: 5/12/2022, time: 4:44 PM, status: new}
//               CircleAvatar(
//                 radius: 40.0,
//                 child: Text('${model['time']}'),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '${model['title']}',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 20),
//                     ),
//                     Text(
//                       '${model['date']}',
//                       style: TextStyle(fontSize: 15, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//               IconButton(
//                   onPressed: () {
//                     Appcubit.get(context)
//                         .UpdateDatabase(status: 'done', id: model['id']);
//                   },
//                   icon: Icon(
//                     Icons.check_circle_outline,
//                     color: Colors.green,
//                   )),
//               IconButton(
//                   onPressed: () {
//                     Appcubit.get(context)
//                         .UpdateDatabase(status: 'archive', id: model['id']);
//                   },
//                   icon: Icon(
//                     Icons.archive_outlined,
//                     color: Colors.black45,
//                   )),
//             ],
//           )
//         ],
//       ),
//     ),
//   ),
// );

// Widget tasksBuild({
//   @required List<Map>? task,
// }) =>
//     BuildCondition(
//       condition: task!.length > 0,
//       builder: (context) => ListView.separated(
//         itemBuilder: (context, index) => buildIteamTasks(task[index], context),
//         separatorBuilder: (context, index) => Container(
//           color: Colors.grey,
//         ),
//         itemCount: task.length,
//       ),
//       fallback: (context) => Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.menu,
//                 size: 100,
//                 color: Colors.grey,
//               ),
//               Text(
//                 "No Tasks Yet, Please Add Some taska.",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           )),
//     );

// Widget newsArticalBluder(list, context, {isSearch = false}) {
//   return BuildCondition(
//     condition: list.isNotEmpty,
//     builder: (context) => ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemBuilder: (context, index) => buildArticl(list[index], context),
//         separatorBuilder: (context, index) => Padding(
//           padding: const EdgeInsetsDirectional.only(
//               start: 21, end: 21, bottom: 10),
//           child: Container(
//             height: 1,
//             color: Colors.grey[300],
//           ),
//         ),
//         itemCount: list.length),
//     fallback: (context) =>isSearch ? Container(): Center(child: CircularProgressIndicator.adaptive()),
//   );
// }

// Widget buildArticl(artical, context) {
//   return InkWell(
//     onTap:(){
//       navigatorTo(context, WebViewScreen(url: artical['url']));
//     },
//     child: Padding(
//       padding: const EdgeInsetsDirectional.only(
//           start: 20, bottom: 10, top: 10, end: 20),
//       child: Row(
//         children: [
//           Container(
//             width: 150,
//             height: 150,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       "${artical['urlToImage'] ?? "https://bitsofco.de/content/images/2018/12/Screenshot-2018-12-16-at-21.06.29.png"}"),
//                   fit: BoxFit.cover,
//                 )),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//           Expanded(
//               child: Container(
//                   width: 150,
//                   height: 150,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                           child: Text(
//                             "${artical['title']}",
//                             style: Theme.of(context).textTheme.bodyText1,
//                             maxLines: 3,
//                             overflow: TextOverflow.ellipsis,
//                           )),
//                       Text(
//                         "${artical['publishedAt']}",
//                         style: TextStyle(
//                             fontSize: 15,
//                             overflow: TextOverflow.ellipsis,
//                             color: Colors.grey),
//                       )
//                     ],
//                   )))
//         ],
//       ),
//     ),
//   );
// }

void navigatorTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget ) );

void navigatorToReplacement(context, Widget) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => Widget));
Widget buildBookItem(String? name) => Container(
  color: Colors.white,
  child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
          image: AssetImage("assets/images/PDF.png"),
          width: double.infinity,
          height: 110,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          name!,
          textAlign: TextAlign.start,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  ),
);


void showToast({
  @required String? message,
  @required ToastStates? state,
}) =>
    Fluttertoast.showToast(
        msg: message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: chooseToastColor(state!),
        textColor: Colors.white,
        fontSize: 16.0.sp);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color? chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget builtDrawerItem(context,
        {@required IconData? icon,
        @required String? pageName,
        @required VoidCallback? onTap}) =>
    InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25.w,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              pageName!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );

PreferredSizeWidget defaultAppBarItem(context){
  return  AppBar(
    elevation: 0,

    title: Text( "",style: TextStyle(
      fontSize: 25.sp,
      color: HexColor("#EAEAEA"),
    ),


    ),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor("#EAEAEA"),
        systemNavigationBarColor:HexColor("#EAEAEA") ,
        statusBarBrightness: Brightness.light,

        statusBarIconBrightness: Brightness.dark
    ),

    backgroundColor: HexColor("#EAEAEA"),

  );
}
  Widget buildDilog({context,}){
  return  AnimatedButton(
    text: 'Passing Data Back from Dialog',
    pressEvent: () async {
      final dismissMode = await AwesomeDialog(
        context: context,
        dialogType: DialogType.NO_HEADER,
        buttonsBorderRadius: const BorderRadius.all(
          Radius.circular(2),
        ),
        animType: AnimType.RIGHSLIDE,
        title: 'Passing Data Back',
        titleTextStyle:  TextStyle(
          fontSize: 32.sp,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w600,
        ),
        desc: 'Dialog description here...',
        showCloseIcon: true,
        btnCancelOnPress: () {},

        btnOkOnPress: () {},
        autoDismiss: false,
         barrierColor: Colors.purple[900]?.withOpacity(0.54),
      ).show();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dismissed by $dismissMode'),
        ),
      );
    },
  );

 }