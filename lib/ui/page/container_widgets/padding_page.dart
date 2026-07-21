import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {
  const PaddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '填充页',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // 无 Padding 的对照组
            _buildItem(
              label: '无 Padding',
              padding: EdgeInsets.zero,
              color: Colors.red,
            ),

            // all — 四面等距
            _buildItem(
              label: 'EdgeInsets.all(20)',
              padding: const EdgeInsets.all(20),
              color: Colors.blue,
            ),

            // symmetric — 水平/垂直对称
            _buildItem(
              label: 'EdgeInsets.symmetric(h:30, v:10)',
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              color: Colors.green,
            ),

            // only — 精准控制
            _buildItem(
              label: 'EdgeInsets.only(left:40, top:10)',
              padding: const EdgeInsets.only(left: 40, top: 10),
              color: Colors.orange,
            ),

            // fromLTRB — 四值独立
            _buildItem(
              label: 'EdgeInsets.fromLTRB(10,20,30,40)',
              padding: const EdgeInsets.fromLTRB(10, 20, 30, 40),
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildItem({
    required String label,
    required EdgeInsetsGeometry padding,
    required Color color,
  }) {
    return Scrollbar(
      // 显示进度条
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Container(
              // 灰色边框为 Padding Widget 的边界
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.5),
              ),
              child: Padding(
                padding: padding,
                child: Container(
                  width: double.infinity,
                  height: 60,
                  alignment: Alignment.center,
                  color: color.withValues(alpha: 0.3),
                  child: Text(
                    'child',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
