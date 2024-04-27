import 'package:shared_preferences/shared_preferences.dart';

class Cache_Helper {
  static SharedPreferences? sharedpref;
  static Init() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  static Future<bool?> savedata(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedpref?.setString(key, value);
    return await sharedpref?.setBool(key, value);
  }

  static dynamic getsaved({required String key}) {
    return sharedpref?.get(key);
  }

  static dynamic removesaved({required String key}) {
    return sharedpref?.remove(key);
  }
}
