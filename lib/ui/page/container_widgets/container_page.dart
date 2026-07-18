import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '容器 Container',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding 与 Margin 对比
            const Text(
              'Padding (内边距) 与 Margin (外边距)对比:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                // 无 Padding 和 Margin
                _buildExampleBox(
                  label: '无 Padding/Margin',
                  containerColor: Colors.grey.shade200,
                  padding: 0,
                  margin: 0,
                ),
                // 有 Padding
                _buildExampleBox(
                  label: '有 Padding',
                  containerColor: Colors.lightGreen.shade200,
                  padding: 16,
                  margin: 0,
                ),
                // 有 Margin
                _buildExampleBox(
                  label: '有 Margin',
                  containerColor: Colors.lightBlue.shade200,
                  padding: 0,
                  margin: 16,
                ),
                // 有 Padding 和 Margin
                _buildExampleBox(
                  label: '同时有 Padding 和 Margin',
                  containerColor: Colors.orange.shade200,
                  padding: 8,
                  margin: 16,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 综合应用示例
            const Text(
              '综合应用示例:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            NeonBox(),
          ],
        ),
      ),
    );
  }

  /// 构建 Padding/Margin 对比的示例小方块
  Widget _buildExampleBox({
    required String label,
    required Color containerColor,
    required double padding,
    required double margin,
  }) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          padding: EdgeInsets.all(padding),
          margin: EdgeInsets.all(margin),
          decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(color: Colors.black, width: 1),
          ),
          child: Container(
            color: Colors.red.withValues(alpha: 0.5),
            child: const Center(
              child: Text('子组件', textAlign: TextAlign.center),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

/// Container复杂效果演示
class NeonBox extends StatelessWidget {
  const NeonBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 子组件在容器内的对齐方式
      alignment: Alignment.center,

      // 内边距
      padding: const EdgeInsets.all(30),

      // 外边距
      margin: const EdgeInsets.all(40),

      // 宽度
      width: 300,

      // 高度
      height: 300,

      // 额外约束（限制最小/最大尺寸）
      constraints: const BoxConstraints(
        minWidth: 200,
        minHeight: 200,
        maxWidth: 350,
        maxHeight: 350,
      ),

      // 变换矩阵（轻微旋转 + 缩放）
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // 透视效果
        ..rotateZ(0.05), // 微倾斜
      // 变换的锚点
      transformAlignment: Alignment.center,

      // 裁剪行为
      clipBehavior: Clip.antiAlias,

      // 背景装饰
      decoration: BoxDecoration(
        // 渐变背景
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFF0B1D3A), // 深海夜幕蓝
            Color(0xFF163B5C), // 深海水蓝
            Color(0xFFD4622B), // 暮光橘
            Color(0xFFF4A261), // 暖阳橘
          ],
          stops: [0.0, 0.3, 0.7, 1.0],
        ),

        // 圆角
        borderRadius: BorderRadius.circular(24),

        // 发光边框
        border: Border.all(
          color: const Color(0xFFFF8C42), // 橘光
          width: 2,
        ),

        // 多层阴影
        boxShadow: const [
          // 外层大辉光
          BoxShadow(
            color: Color(0x80FF8C42), // 橘色暖光
            blurRadius: 40,
            spreadRadius: 4,
          ),

          // 中层辉光
          BoxShadow(
            color: Color(0x40E76F51), // 珊瑚橘红
            blurRadius: 60,
            spreadRadius: -10,
            offset: Offset(0, 10),
          ),

          // 内层微弱辉光
          BoxShadow(
            color: Color(0x30FFB347), // 金橘微光
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),

      // 前景装饰
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withValues(alpha: 0.10), // 顶部高光
            Colors.transparent, // 中段透明
            const Color(0xFF0B1D3A).withValues(alpha: 0.15), // 底部加深深蓝
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),

      // 子组件
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 渐变图标
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color(0xFFFF8C42), // 温暖橘
                Color(0xFFFFD166), // 日落金
              ],
            ).createShader(bounds),
            child: const Icon(
              Icons.waves, // 海浪图标
              size: 64,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),

          // 标题
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color(0xFFFF8C42), // 温暖橘
                Color(0xFFFFD166), // 日落金
              ],
            ).createShader(bounds),
            child: const Text(
              'SUNSET',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
