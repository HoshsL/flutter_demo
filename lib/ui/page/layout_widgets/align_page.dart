import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  const AlignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '对齐与相对定位',
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
              Text(
                '坐标系对比 (0.5, 0.5)',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('Alignment 原点在中心，FractionalOffset 原点在左上角'),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _coordBox(
                      'Alignment',
                      '原点:中心(0,0)',
                      const Alignment(0.5, 0.5),
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _coordBox(
                      'FractionalOffset',
                      '原点:左上角(0,0)',
                      const FractionalOffset(0.5, 0.5),
                      Colors.deepOrange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              Text(
                'widthFactor / heightFactor',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('子组件 50×50，factor 控制 Align 自身大小倍数'),
              const SizedBox(height: 8),
              Row(
                children: [
                  _factorBox('null(撑满)', null),
                  const SizedBox(width: 12),
                  _factorBox('factor: 1.0', 1.0),
                  const SizedBox(width: 12),
                  _factorBox('factor: 2.0', 2.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 坐标系对比容器
Widget _coordBox(
  String label,
  String sub,
  AlignmentGeometry align,
  Color color,
) {
  return Column(
    children: [
      Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      Text(sub, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      const SizedBox(height: 4),
      Container(
        height: 140,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.grey.shade100,
        ),
        child: Align(
          alignment: align,
          child: Container(width: 24, height: 24, color: color),
        ),
      ),
    ],
  );
}

/// Factor 演示容器
Widget _factorBox(String label, double? factor) {
  return Expanded(
    child: Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            color: Colors.grey.shade100,
          ),
          child: Align(
            widthFactor: factor,
            heightFactor: factor,
            alignment: Alignment.center,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: const Text('50', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    ),
  );
}
