import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  const WrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '流式布局',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Scrollbar(
        // 显示进度条
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //展示 spacing (主轴间距)
              const Text(
                'spacing (主轴方向子widget的间距):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('spacing: 20.0 (观察水平方向上每个方块之间的距离)'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 20.0, // 主轴（水平）间距
                children: List.generate(6, (index) {
                  return Container(
                    width: 60,
                    height: 60,
                    color: Colors.blue.shade200,
                    child: Center(child: Text('$index')),
                  );
                }),
              ),
              const SizedBox(height: 24),

              // 展示 runSpacing (纵轴/交叉轴间距)
              const Text(
                'runSpacing (纵轴/交叉轴方向的间距):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('spacing: 10.0, runSpacing: 30.0 (观察垂直方向上行与行之间的距离)'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10.0, // 主轴间距
                runSpacing: 30.0, // 纵轴（垂直）间距
                children: List.generate(9, (index) {
                  return Container(
                    width: 70,
                    height: 50,
                    color: Colors.green.shade200,
                    child: Center(child: Text('$index')),
                  );
                }),
              ),
              const SizedBox(height: 24),

              // 展示 runAlignment (纵轴对齐方式)
              const Text(
                'runAlignment (纵轴方向的对齐方式):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'runAlignment: WrapAlignment.spaceBetween (行与行之间平分剩余垂直空间)',
              ),
              const SizedBox(height: 8),
              // 必须给 Wrap 一个大于内容实际高度的固定高度，runAlignment 才能生效并看出效果
              Container(
                height: 300,
                color: Colors.grey.shade200, // 灰色背景帮助看清 Wrap 的总高度区域
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  runAlignment: WrapAlignment.spaceBetween, // 纵轴对齐方式：两端对齐并平分空间
                  children: List.generate(12, (index) {
                    return Container(
                      width: 60,
                      height: 40,
                      color: Colors.orange.shade200,
                      child: Center(child: Text('$index')),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                '对比: runAlignment: WrapAlignment.center (所有行在垂直方向上整体居中)',
              ),
              const SizedBox(height: 8),
              Container(
                height: 300,
                color: Colors.grey.shade200,
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  runAlignment: WrapAlignment.center, // 纵轴对齐方式：整体居中
                  children: List.generate(12, (index) {
                    return Container(
                      width: 60,
                      height: 40,
                      color: Colors.purple.shade200,
                      child: Center(child: Text('$index')),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
