import 'dart:math';
import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class ListViewBuilderPage extends StatelessWidget {
  const ListViewBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'ListView.builder',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Scrollbar(
        // 显示进度条
        child: Center(
          child: ListView.builder(
            itemCount: 40,
            itemExtent: 40.0,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const Text(
                  '遭到特殊对待的文本😭',
                  style: TextStyle(fontSize: 22),
                );
              }

              final Color randomColor = _genRandomColor();
              Hct sourceColor = Hct.fromInt(randomColor.toARGB32());

              // 生成配色方案
              DynamicScheme lightScheme = SchemeTonalSpot(
                sourceColorHct: sourceColor,
                isDark: false,
                contrastLevel: 0.0,
              );

              return Container(
                // 在ListView中子组件在交叉轴上的度受ListView的约束，故设置width没有作用
                width: 1,
                // 由于设置了itemExtent强制高度，故设置height没有作用
                height: 100,
                color: randomColor,
                alignment: AlignmentGeometry.centerLeft,
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  '色块 $index',
                  style: TextStyle(
                    color: Color(lightScheme.primary),
                    fontSize: 18,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Color _genRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      random.nextInt(255),
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
