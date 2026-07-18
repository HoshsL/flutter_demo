import 'package:flutter/material.dart';

class ImagesAndIconPage extends StatelessWidget {
  const ImagesAndIconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '图片与ICON',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 12.0,
          children: [
            // 加载图片
            Row(
              spacing: 12.0,
              children: [
                Image.asset('assets/images/isdu.png', width: 50.0),

                // 从网络加载图片
                Image.network(
                  'https://i.sdu.edu.cn/img/ic_launcher.png',
                  width: 50.0,
                ),
              ],
            ),

            // fit属性
            Row(
              spacing: 12.0,
              children: [
                Image.asset(
                  'assets/images/isdu.png',
                  width: 50.0,
                  height: 40.0,
                  fit: BoxFit.contain,
                ),
                const Text('BoxFit.contain'),
              ],
            ),
            Row(
              spacing: 12.0,
              children: [
                Image.asset(
                  'assets/images/isdu.png',
                  width: 50.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                ),
                const Text('BoxFit.cover'),
              ],
            ),
            Row(
              spacing: 12.0,
              children: [
                Image.asset(
                  'assets/images/isdu.png',
                  width: 50.0,
                  height: 40.0,
                  fit: BoxFit.fill,
                ),
                const Text('BoxFit.fill'),
              ],
            ),
            Row(
              spacing: 12.0,
              children: [
                Image.asset(
                  'assets/images/isdu.png',
                  width: 50.0,
                  height: 40.0,
                  fit: BoxFit.fitHeight,
                ),
                const Text('BoxFit.fitHeight'),
              ],
            ),
            Row(
              spacing: 12.0,
              children: [
                Image.asset(
                  'assets/images/isdu.png',
                  width: 50.0,
                  height: 40.0,
                  fit: BoxFit.fitWidth,
                ),
                const Text('BoxFit.fitWidth'),
              ],
            ),
            Row(
              spacing: 12.0,
              children: [
                Image.asset(
                  'assets/images/isdu.png',
                  width: 50.0,
                  height: 40.0,
                  fit: BoxFit.none,
                ),
                const Text('BoxFit.none'),
              ],
            ),
            Row(
              spacing: 12.0,
              children: [
                Image.asset(
                  'assets/images/isdu.png',
                  width: 50.0,
                  height: 40.0,
                  fit: BoxFit.scaleDown,
                ),
                const Text('BoxFit.scaleDown'),
              ],
            ),

            // 混色
            Image.asset(
              'assets/images/isdu.png',
              width: 50.0,
              color: Colors.yellow,
              colorBlendMode: BlendMode.difference,
            ),

            // 重复图片
            Image.asset(
              'assets/images/isdu.png',
              width: 130.0,
              height: 50.0,
              repeat: ImageRepeat.repeatX,
            ),

            // ICON
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Icon(
                  Icons.fitness_center,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Icon(
                  Icons.campaign,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
