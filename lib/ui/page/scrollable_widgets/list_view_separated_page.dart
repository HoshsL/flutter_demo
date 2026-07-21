import 'package:flutter/material.dart';

class ListViewSeparatedPage extends StatelessWidget {
  const ListViewSeparatedPage({super.key});

  List<Map<String, dynamic>> get _items => [
    ...[
      {'name': '张三', 'sub': '这是第一条数据', 'isStatic': true},
      {'name': '李四', 'sub': '这是第二条数据', 'isStatic': true},
      {'name': '王五', 'sub': '这是第三条数据', 'isStatic': true},
      {'name': '赵六', 'sub': '这是第四条数据', 'isStatic': true},
    ],
    ...List.generate(
      300,
      (index) => {
        'name': '新增用户 ${index + 1}',
        'sub': '这是动态生成的第 ${index + 1} 条数据',
        'isStatic': false,
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final items = _items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'ListView.separated',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Scrollbar(
        child: ListView.separated(
          itemCount: items.length, // 设置总共有多少项
          // 构建列表项
          itemBuilder: (context, index) {
            debugPrint('正在构建 Item $index');
            final item = items[index];
            return ListTile(
              leading: item['isStatic']
                  ? const Icon(Icons.person)
                  : const Icon(Icons.person_outline),
              title: Text(item['name']),
              subtitle: Text(item['sub']),
            );
          },

          // separatorBuilder: 负责构建分隔线（按需构建）
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
