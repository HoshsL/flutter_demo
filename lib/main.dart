import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/page/home_page.dart';
import 'package:flutter_demo/utils/sp_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化shared_preferences工具类
  await SPUtils.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
      theme: _makeAppTheme(),
    );
  }
}

ThemeData _makeAppTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    cardColor: Colors.white,
    shadowColor: Colors.grey,
  );
}
