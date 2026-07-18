enum SPKey {
  counterFAB('counter_fab');

  final String key;

  const SPKey(this.key);

  /// 生成 allowList 给 SharedPreferencesWithCache 用
  static Set<String> get allowList => SPKey.values.map((e) => e.key).toSet();
}
