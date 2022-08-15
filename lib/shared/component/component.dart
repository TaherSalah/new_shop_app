import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../cubit/states.dart';
import '../styles/style.dart';

Widget builderArticlesItems(articles, context) => InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 135.0,
              width: 135.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.deepOrangeAccent,
                image: DecorationImage(
                  image: NetworkImage(
                    '${articles['urlToImage']}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              // ignore: sized_box_for_whitespace

              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${articles['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${articles['publishedAt']}',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

class WebViewScreen {}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 2.0,
        color: Colors.grey[300],
      ),
    );
Widget articlesBuilderItems(list, BuildContext context) => Conditional.single(
    context: context,
    conditionBuilder: (context) => list.length > 0,
    widgetBuilder: (context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              builderArticlesItems(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length,
        ),
    fallbackBuilder: (context) =>
        const Center(child: CircularProgressIndicator()));

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
Widget defaultTextButton(
        {required VoidCallback onPressed, required String text}) =>
    TextButton(onPressed: onPressed, child: Text(text.toUpperCase()));
void navigateTo(BuildContext context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) => false); ////////////////// return false or true ////////////////
