import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'ListView',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Scrollbar(
        child: ListView(
          children: [
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('张三'),
              subtitle: Text('这是第一条数据'),
            ),
            const Divider(), // 分隔线
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('李四'),
              subtitle: Text('这是第二条数据'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('王五'),
              subtitle: Text('这是第三条数据'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('赵六'),
              subtitle: Text('这是第四条数据'),
            ),
            const Divider(),
            ...List.generate(300, (index) {
              debugPrint('正在构建 Item $index');
              return Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person_outline),
                    title: Text('新增用户 ${index + 1}'),
                    subtitle: Text('这是动态生成的第 ${index + 1} 条数据'),
                  ),
                  const Divider(),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
