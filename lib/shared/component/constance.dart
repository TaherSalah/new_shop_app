import '../../moduels/login/login_screen.dart';
import '../network/local/cache_helper.dart';
import 'component.dart';

///////// SignOut Method ///////////
void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value) {
    if(value ==true){
      navigateAndFinish(context, const LoginScreen());
    }
  });
}
////////////////// var Token /////////////////
String tokenData='';