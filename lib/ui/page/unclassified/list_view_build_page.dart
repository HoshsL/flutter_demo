import 'dart:math';
import 'package:flutter/material.dart';

class ListViewBuildPage extends StatelessWidget {
  const ListViewBuildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '列表',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 40,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Text(
                "遭到特殊对待的文本😭\nTips: 可以往下滑",
                style: TextStyle(fontSize: 25),
              );
            }
            return Container(
              // 尝试设置width的宽，但是没有作用，请思考这是为什么
              width: 10,
              height: 30,
              color: _genRandomColor(),
              child: Text(
                "色块 $index",
                // 让文字颜色也随机
                style: TextStyle(color: _genRandomColor()),
              ),
            );
          },
        ),
      ),
    );
  }

  Color _genRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      random.nextInt(255),
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
