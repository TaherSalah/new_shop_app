import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences sharedHelperPreference;

  static init()async{
    sharedHelperPreference= await SharedPreferences.getInstance();
  }
  static Future<bool> putBoolean ({required String key,required bool value})async{
    return await sharedHelperPreference.setBool(key, value);
  }
  static bool? getBoolean ({required String key}){
    return  sharedHelperPreference.getBool(key);
  }
}