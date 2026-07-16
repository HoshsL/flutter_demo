import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key, this.delta = 1});

  final int delta;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // 计数变量
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // 按钮被点击后增加计数变量
        setState(() {
          //通过继承的widget属性访问组件类的属性
          _count += widget.delta;
        });
      },
      // 在按钮中显示当前计数值
      child: Text(_count < 100 ? "我被点$_count次了" : "$_count次了(#`Д´)ﾉ"),
      onLongPress: () {
        setState(() {
          _count = 0;
        });
      },
    );
  }
}
