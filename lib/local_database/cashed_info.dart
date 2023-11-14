import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_arman/constants/app_keys.dart';

class CashedInfo{
  static Future saveData(String data) async{
    final database = await SharedPreferences.getInstance();
    await database.setString(AppKeys.storageKey, data);
  }

  static Future<String?> getSavedData() async{
    final database = await SharedPreferences.getInstance();
    return database.getString(AppKeys.storageKey);
  }

  static Future clearStorage() async{
    final database = await SharedPreferences.getInstance();
    return await database.remove(AppKeys.storageKey);
  }
}