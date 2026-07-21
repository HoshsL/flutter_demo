import 'package:flutter/material.dart';

class RowColumnPage extends StatelessWidget {
  const RowColumnPage({super.key});

  Widget _item(
    String label,
    Color color, {
    double width = 50,
    double height = 50,
  }) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      color: color,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '线性布局',
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
              // textDirection 示例
              const Text(
                'textDirection: rtl (从右向左排列)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  textDirection: TextDirection.rtl, // 改变排列方向：从右向左
                  children: [
                    _item('A', Colors.red),
                    _item('B', Colors.green),
                    _item('C', Colors.blue),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // MainAxisSize 示例
              const Text(
                'mainAxisSize: min (包裹内容，不撑满屏幕)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Row 宽度仅包裹子组件，不占满整行
                  children: [
                    _item('A', Colors.red),
                    _item('B', Colors.green),
                    _item('C', Colors.blue),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // MainAxisAlignment 示例
              const Text(
                'mainAxisAlignment: spaceBetween (两端对齐，中间平分)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴对齐方式
                  children: [
                    _item('A', Colors.red),
                    _item('B', Colors.green),
                    _item('C', Colors.blue),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // VerticalDirection 和 CrossAxisAlignment 示例
              const Text(
                'verticalDirection: up + crossAxisAlignment: end',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                '(垂直起点变为底部，end即为顶部对齐)',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 8),
              Container(
                height: 120, // 必须给定高度，才能看出交叉轴（垂直）对齐的效果
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  verticalDirection: VerticalDirection.up, // 交叉轴起点变为底部
                  crossAxisAlignment: CrossAxisAlignment.end, // 相对于起点的终点，即顶部对齐
                  children: [
                    _item('A', Colors.red, width: 50, height: 40),
                    _item('B', Colors.green, width: 50, height: 70),
                    _item('C', Colors.blue, width: 50, height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
