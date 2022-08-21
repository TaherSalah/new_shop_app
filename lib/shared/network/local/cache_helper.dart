import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  ///////////  take obj from SharedPreferences ////////
  static late SharedPreferences sharedHelperPreference;
  ///////////   init method SharedPreferences ////////
  static init()async{
    sharedHelperPreference= await SharedPreferences.getInstance();
  }
  ///////////   put boolean method From SharedPreferences ////////
  static Future<bool> putBoolean ({required String key,required bool value})async{
    return await sharedHelperPreference.setBool(key, value);
  }
  ///////////   Get Data method From SharedPreferences ////////
  static dynamic getData ({required String key}){
    return  sharedHelperPreference.get(key);
  }

///////////   Save All Data method From SharedPreferences ////////
 static Future<bool> saveData ({required String key,required dynamic value})async
  {
    if(value is String)
    {
      return await sharedHelperPreference.setString(key, value);
    }else if(value is int){
      return await sharedHelperPreference.setInt(key, value);
    }else if(value is bool){
      return await sharedHelperPreference.setBool(key, value);
    }
    return await sharedHelperPreference.setDouble(key, value);
  }

  ///////////////////////////// remove Data Method ////////////////////////////

static Future <bool> removeData({required String key})async{
    return await sharedHelperPreference.remove(key);
}
}
