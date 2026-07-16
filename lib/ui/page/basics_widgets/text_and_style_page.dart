import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class TextAndStylePage extends StatefulWidget {
  const TextAndStylePage({super.key});

  @override
  State<TextAndStylePage> createState() => _TextAndStylePageState();
}

class _TextAndStylePageState extends State<TextAndStylePage> {
  final TapGestureRecognizer _uriRecognizer = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();
    // 绑定回调函数
    final Uri url = Uri.parse("https://online.sdu.edu.cn/");
    _uriRecognizer.onTap = () async {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        print('无法处理此 URL: $url');
      }
    };
  }

  @override
  void dispose() {
    // 在Widget销毁时，务必释放资源
    _uriRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '文本与样式',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Column(
        spacing: 12.0,
        children: [
          // 普通文本
          Text("Hello World!"),

          // 通过比例放大的文本
          Text("Hello World!", textScaler: TextScaler.linear(1.5)),

          // 固定行数，多余部分省略的文本
          Text(
            "Hello World! " * 10,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          // 通过TextStyle设置复杂样式文本
          Text(
            "Hello World!",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 22.0,
              backgroundColor: Colors.amberAccent,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
              decorationColor: Colors.blueAccent,
            ),
          ),

          // 富文本示例，支持点击链接跳转
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "学生在线"),
                TextSpan(
                  text: "https://online.sdu.edu.cn/",
                  style: TextStyle(color: Colors.blue),
                  recognizer: _uriRecognizer,
                ),
              ],
            ),
          ),

          // DefaultTextStyle设置默认文本格式
          DefaultTextStyle(
            style: TextStyle(color: Colors.redAccent, fontSize: 20.0),
            child: Column(
              children: [
                Text("sdu online cga"),
                Text("Hello World!"),
                Text(
                  "Hello World!",
                  style: TextStyle(inherit: false, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
