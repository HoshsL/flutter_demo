import 'package:flutter/material.dart';

class FlexPage extends StatelessWidget {
  const FlexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '弹性布局',
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
              const Text(
                'Flex (direction: Axis.horizontal):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('两个子组件平分空间 (flex: 1 和 flex: 1)'),
              const SizedBox(height: 8),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 80,
                      color: Colors.red,
                      child: const Center(child: Text('flex: 1')),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 80,
                      color: Colors.blue,
                      child: const Center(child: Text('flex: 1')),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const Text('不同比例分配空间 (flex: 2 和 flex: 1)'),
              const SizedBox(height: 8),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 80,
                      color: Colors.green,
                      child: const Center(child: Text('flex: 2')),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 80,
                      color: Colors.orange,
                      child: const Center(child: Text('flex: 1')),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const Text(
                'Flex (direction: Axis.vertical):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('垂直方向按比例分配 (flex: 1, 2, 1)'),
              const SizedBox(height: 8),
              SizedBox(
                height: 400,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.purple,
                        child: const Center(child: Text('flex: 1')),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.teal,
                        child: const Center(child: Text('flex: 2')),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.pink,
                        child: const Center(child: Text('flex: 1')),
                      ),
                    ),
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
