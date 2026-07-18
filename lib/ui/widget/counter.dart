import 'package:flutter/material.dart';
import 'package:flutter_demo/enums/sp_key.dart';
import 'package:flutter_demo/utils/sp_utils.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // 计数变量
  int _count = 0;

  @override
  void initState() {
    super.initState();
    // 读取计数变量
    _count = SPUtils.getInt(SPKey.counterFAB);
  }

  /// 计数器 + 1
  Future<void> _increment() async {
    // 计算新值
    final newValue = _count + 1;

    // 异步保存到本地
    await SPUtils.setInt(SPKey.counterFAB, newValue);

    // 安全检查：防止在 await 期间页面被关掉导致崩溃
    if (!mounted) return;

    // 更新 UI
    setState(() {
      _count = newValue;
    });
  }

  /// 计数器归零
  Future<void> _reset() async {
    await SPUtils.setInt(SPKey.counterFAB, 0);
    if (!mounted) return;

    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // 按钮被点击后增加计数变量
        setState(() {
          _increment();
        });
      },

      // 在按钮中显示当前计数值
      child: Text(_count < 100 ? "我被点$_count次了" : "$_count次了(#`Д´)ﾉ"),
      onLongPress: () {
        // 长按重置计数器变量
        setState(() {
          _reset();
        });
      },
    );
  }
}
