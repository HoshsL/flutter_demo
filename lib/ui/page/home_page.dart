import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/widget/counter.dart';
import 'package:flutter_demo/ui/widget/demo_card.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Flutter Demo',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Expanded(child: DemoCard()),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Opacity(
                  opacity: 0.7,
                  child: SvgPicture.asset('assets/images/logo.svg', width: 150),
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButtonLocation: CustomFabLocation(),
      floatingActionButton: Counter(),
    );
  }
}

// 定义一个新的位置类
class CustomFabLocation extends StandardFabLocation
    with FabEndOffsetX, FabFloatOffsetY {
  final double heightRatio;

  const CustomFabLocation({this.heightRatio = 0.04});

  @override
  double getOffsetY(
    ScaffoldPrelayoutGeometry scaffoldGeometry,
    double adjustment,
  ) {
    // 获取默认的 Y 轴偏移量
    final double defaultOffset = super.getOffsetY(scaffoldGeometry, adjustment);

    // 获取当前 Scaffold 的总高度
    final double screenHeight = scaffoldGeometry.scaffoldSize.height;

    // 根据比例动态计算偏移量
    final double dynamicOffset = screenHeight * heightRatio;

    // 返回减去动态偏移量后的位置
    return defaultOffset - dynamicOffset;
  }
}
