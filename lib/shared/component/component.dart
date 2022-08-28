import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../styles/style.dart';
///////////  Start  Divider Widget /////////////
Widget myDivider() => Container(
  width: double.infinity,
  height: 2.0,
  color: Colors.grey[300],
);
///////////  End  Divider Widget /////////////

///////////  Start  defualt Form Field Widget /////////////
Widget defualtFormField({
  String? Function(String?)? validate,
  required TextEditingController controller,
  required TextInputType type,
  required String hintText,
  required IconData prefix,
  IconData? suffix,
  bool isPassword =false,
VoidCallback? suffixPressed,
  double padding = 15.0,
  double borderRadius = 25.0,
  void Function()? onTap,
  ValueChanged<String>? onChanged,
  String? Function(String?)? onSubmitted,
}) =>
    Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextFormField(
        obscureText: isPassword,
        validator: validate,
        onTap: onTap,
        onChanged: onChanged,
        onFieldSubmitted:onSubmitted ,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Icon(prefix),
          suffixIcon: IconButton(icon: Icon(suffix), onPressed: suffixPressed),
          hintText: hintText,


        ),
      ),
    );
///////////  End  defualt Form Field Widget /////////////

///////////  Start BottomNAvBar GNav  Widget      //////////////

Widget defualtBottomNavigationBar({
  required List<GButton> tabs,
  required ValueChanged<int> onTabChange,
  required int currentIndex,
  required BuildContext context,


})=>Container(
  color:Colors.white,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 12.0),
    child: GNav(
        gap: 8,
        onTabChange:onTabChange,
        selectedIndex:0,
        curve: Curves.fastOutSlowIn,
        backgroundColor:  Colors.white,
        activeColor:defaultColor,
        color: Colors.grey,
        textStyle: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 16.0,color:Colors.white,fontWeight: FontWeight.bold),
        tabBackgroundColor: Colors.black45,
        padding: const EdgeInsets.all(16),
        tabs: tabs,

  ),
));

///////////  Start  default Button Widget /////////////
Widget defaultButton({context, formKey,required VoidCallback onPressed,required String text}) => Center(
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: defaultColor),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
///////////  End  default Button Widget /////////////

///////////  Start  default Text Button Widget /////////////

Widget defaultTextButton(
        {required VoidCallback onPressed, required String text}) =>
    TextButton(onPressed: onPressed, child: Text(text.toUpperCase()));
///////////  End  default Text Button Widget /////////////

///////////  Start navigateTo Method /////////////
void navigateTo(BuildContext context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
///////////  End navigateTo Method /////////////


///////////  Start navigate And Finish Method /////////////
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) => false); //////////////////=> return false or true <==////////////////
///////////  End navigate And Finish Method /////////////
  ///////// Start Show Toast Method /////////////////////

void showToast({
   String? text,
  required ToastStates state
  // required toastStates state
})=>Fluttertoast.showToast(
    msg:text! ,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: choseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0

);
///////// Start Enum Toast States /////////////////////

enum ToastStates {success, error, warning}
// ignore: body_might_complete_normally_nullable
///////// Start choseToastColor Switch /////////////////////

Color? choseToastColor(ToastStates state){
  Color color;
  switch(state)
  {
    case ToastStates.success:
      color=Colors.green;
      break;
    case ToastStates.error:
      color=Colors.red;
      break;
    case ToastStates.warning:
      color=Colors.amber;
  }
  return color;

}

////////////////////// conditional builder ///////////////////////////////
Widget conditionalBuilder({
  required BuildContext context,
required bool Function(BuildContext context) conditionBuilder,
  required Widget Function(BuildContext context) widgetBuilder,
  required Widget Function(BuildContext context) fallbackBuilder
})=>Conditional.single(
    context: context,
    conditionBuilder: conditionBuilder,
    widgetBuilder: widgetBuilder,
    fallbackBuilder: fallbackBuilder
);

////////////////////////   printFullText ////////////////////////////////////////
void printFullText(String text){
  final pattern=RegExp('.{1,800}');
  // ignore: avoid_print
  pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}