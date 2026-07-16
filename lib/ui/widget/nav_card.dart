import 'package:flutter/material.dart';

class NavCard extends StatelessWidget {
  const NavCard({
    super.key,
    this.category = '未分类',
    required this.title,
    required this.destination,
    required this.markColor,
  });

  final String title;
  final Widget destination;
  final Color markColor;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      // 设置外边距，只指定上下边距
      margin: EdgeInsets.only(top: 8, bottom: 8),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        // 设置圆角
        borderRadius: BorderRadius.circular(12.0),
        // 设置阴影
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.4),
            // 阴影的扩散半径
            spreadRadius: 1,
            // 阴影的模糊半径
            blurRadius: 10,
            // 阴影的偏移量 下,右
            offset: Offset(0, 3),
          ),
        ],
      ),
      // 点击事件监听
      child: GestureDetector(
        //单击
        onTap: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => destination));
        },
        //长按
        onLongPress: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('长按了 $title'),
              duration: Duration(seconds: 1),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 4, // 色条宽度
                height: 30,
                decoration: BoxDecoration(color: markColor),
              ),

              // 右侧内容区
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      Text(
                        category,
                        textScaler: TextScaler.linear(0.75),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
