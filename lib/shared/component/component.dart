import 'package:flutter/material.dart';
import '../styles/style.dart';
///////////  Start  Divider Widget /////////////
Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 2.0,
        color: Colors.grey[300],
      ),
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


///////////  Start  default Button Widget /////////////
Widget defaultButton({context, formKey,required VoidCallback onPressed}) => Center(
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: defaultColor),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            'login'.toUpperCase(),
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
