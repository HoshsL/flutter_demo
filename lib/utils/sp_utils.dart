import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_demo/enums/sp_key.dart';

class SPUtils {
  SPUtils._();

  static late final SharedPreferencesWithCache _prefs;

  /// 在 main() 中调用一次
  static Future<void> init() async {
    _prefs = await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(
        allowList: SPKey.allowList, // 从枚举生成
      ),
    );
  }

  /// 获取 int，默认 0
  static int getInt(SPKey key) => _prefs.getInt(key.key) ?? 0;

  /// 设置 int
  static Future<void> setInt(SPKey key, int value) =>
      _prefs.setInt(key.key, value);

  /// 获取 bool，默认 false
  static bool getBool(SPKey key) => _prefs.getBool(key.key) ?? false;

  /// 设置 bool
  static Future<void> setBool(SPKey key, bool value) =>
      _prefs.setBool(key.key, value);

  /// 获取 String，默认 ''
  static String getString(SPKey key) => _prefs.getString(key.key) ?? '';

  /// 设置 String
  static Future<void> setString(SPKey key, String value) =>
      _prefs.setString(key.key, value);

  /// 删除指定 key
  static Future<void> remove(SPKey key) => _prefs.remove(key.key);

  /// 清除全部
  static Future<void> clearAll() => _prefs.clear();
}
