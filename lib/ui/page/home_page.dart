import 'package:flutter/material.dart';
import 'package:flutter_demo/enums/example_category.dart';
import 'package:flutter_demo/ui/page/basics_widgets/button_page.dart';
import 'package:flutter_demo/ui/page/basics_widgets/form_page.dart';
import 'package:flutter_demo/ui/page/basics_widgets/images_and_icon_page.dart';
import 'package:flutter_demo/ui/page/basics_widgets/input_page.dart';
import 'package:flutter_demo/ui/page/basics_widgets/progress_page.dart';
import 'package:flutter_demo/ui/page/basics_widgets/switch_and_checkbox_page.dart';
import 'package:flutter_demo/ui/page/basics_widgets/text_and_style_page.dart';
import 'package:flutter_demo/ui/page/container_widgets/container_page.dart';
import 'package:flutter_demo/ui/page/container_widgets/padding_page.dart';
import 'package:flutter_demo/ui/page/unclassified/empty_page.dart';
import 'package:flutter_demo/ui/page/unclassified/list_view_build_page.dart';
import 'package:flutter_demo/ui/page/unclassified/page_return_data_page_a.dart';
import 'package:flutter_demo/ui/page/unclassified/request_baidu_page.dart';
import 'package:flutter_demo/ui/widget/counter.dart';
import 'package:flutter_demo/ui/widget/demo_card.dart';
import 'package:flutter_demo/ui/widget/nav_card.dart';
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
              Expanded(
                child: DemoCard(
                  cardTitle: '导航区',
                  children: [
                    NavCard(
                      title: '文本与样式',
                      destination: TextAndStylePage(),
                      markColor: Colors.deepPurple.shade200,
                      category: ExampleCategory.basics.label,
                    ),
                    NavCard(
                      title: '按钮',
                      destination: ButtonPage(),
                      markColor: Colors.deepPurple.shade200,
                      category: ExampleCategory.basics.label,
                    ),
                    NavCard(
                      title: '图片与ICON',
                      destination: ImagesAndIconPage(),
                      markColor: Colors.deepPurple.shade400,
                      category: ExampleCategory.basics.label,
                    ),
                    NavCard(
                      title: '开关与复选框',
                      destination: SwitchAndCheckboxPage(),
                      markColor: Colors.deepPurple.shade400,
                      category: ExampleCategory.basics.label,
                    ),
                    NavCard(
                      title: '输入框',
                      destination: InputPage(),
                      markColor: Colors.deepPurple.shade800,
                      category: ExampleCategory.basics.label,
                    ),
                    NavCard(
                      title: '表单',
                      destination: FormPage(),
                      markColor: Colors.deepPurple.shade800,
                      category: ExampleCategory.basics.label,
                    ),
                    NavCard(
                      title: '进度条',
                      destination: ProgressPage(),
                      markColor: Colors.deepPurple.shade400,
                      category: ExampleCategory.basics.label,
                    ),
                    NavCard(
                      title: '填充',
                      destination: PaddingPage(),
                      markColor: Colors.deepPurple.shade200,
                      category: ExampleCategory.container.label,
                    ),
                    NavCard(
                      title: '容器 Container',
                      destination: ContainerPage(),
                      markColor: Colors.deepPurple.shade400,
                      category: ExampleCategory.container.label,
                    ),
                    NavCard(
                      title: '空白页',
                      destination: EmptyPage(),
                      markColor: Colors.blueGrey.shade300,
                    ),
                    NavCard(
                      title: '列表',
                      destination: ListViewBuildPage(),
                      markColor: Colors.blueGrey.shade300,
                    ),
                    NavCard(
                      title: '页面传输数据',
                      destination: PageReturnDataPageA(),
                      markColor: Colors.blueGrey.shade300,
                    ),
                    NavCard(
                      title: '请求百度首页',
                      destination: RequestBaiduPage(),
                      markColor: Colors.blueGrey.shade300,
                    ),
                  ],
                ),
              ),
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
