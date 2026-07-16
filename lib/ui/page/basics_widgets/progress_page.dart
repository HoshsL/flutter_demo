import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '进度条',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(12.0),
        child: Column(
          spacing: 24.0,
          children: [
            // 模糊进度条
            LinearProgressIndicator(
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation(
                Theme.of(context).colorScheme.primary,
              ),
            ),

            // 显示30%的进度条
            LinearProgressIndicator(
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation(
                Theme.of(context).colorScheme.primary,
              ),
              value: 0.3,
            ),

            // 圆形进度条
            Row(
              spacing: 12.0,
              children: [
                // 模糊进度条
                CircularProgressIndicator(
                  backgroundColor: Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),

                // 显示30%的进度条
                CircularProgressIndicator(
                  backgroundColor: Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).colorScheme.primary,
                  ),
                  value: 0.3,
                ),
              ],
            ),

            // 自定义尺寸
            SizedBox(
              height: 1,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).colorScheme.primary,
                ),
                value: 0.3,
              ),
            ),
            SizedBox(
              height: 100,
              width: 140,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
            ),

            // 进度色动画
            LinearProgressIndicator(
              backgroundColor: Colors.grey.shade300,
              valueColor: ColorTween(
                begin: Colors.grey.shade300,
                end: Theme.of(context).colorScheme.primary,
              ).animate(_animationController),
              value: _animationController.value,
            ),
            ElevatedButton(
              onPressed: () {
                _animationController.reset();
                _animationController.forward();
              },
              child: Text('播放动画'),
            ),
          ],
        ),
      ),
    );
  }
}
