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
import 'package:flutter_demo/ui/page/layout_widgets/align_page.dart';
import 'package:flutter_demo/ui/page/layout_widgets/flex_page.dart';
import 'package:flutter_demo/ui/page/layout_widgets/row_column_page.dart';
import 'package:flutter_demo/ui/page/layout_widgets/stack_page.dart';
import 'package:flutter_demo/ui/page/layout_widgets/wrap_page.dart';
import 'package:flutter_demo/ui/page/scrollable_widgets/list_view_page.dart';
import 'package:flutter_demo/ui/page/scrollable_widgets/list_view_separated_page.dart';
import 'package:flutter_demo/ui/page/scrollable_widgets/single_child_scroll_view_page.dart';
import 'package:flutter_demo/ui/page/scrollable_widgets/list_view_builder_page.dart';
import 'package:flutter_demo/ui/page/unclassified/empty_page.dart';
import 'package:flutter_demo/ui/page/unclassified/page_return_data_page_a.dart';
import 'package:flutter_demo/ui/page/unclassified/request_baidu_page.dart';

/// 导航卡片数据模型
class NavCardData {
  const NavCardData({
    required this.title,
    required this.destinationBuilder,
    required this.markColor,
    required this.category,
  });

  final String title;
  final WidgetBuilder destinationBuilder;
  final Color markColor;
  final ExampleCategory category;
}

/// 导航卡片注册表
class NavRoutes {
  NavRoutes._();

  /// 所有导航卡片数据
  static final List<NavCardData> items = [
    // 基础组件
    NavCardData(
      title: '文本与样式',
      destinationBuilder: (context) => const TextAndStylePage(),
      markColor: Colors.deepPurple.shade200,
      category: ExampleCategory.basics,
    ),
    NavCardData(
      title: '按钮',
      destinationBuilder: (context) => const ButtonPage(),
      markColor: Colors.deepPurple.shade200,
      category: ExampleCategory.basics,
    ),
    NavCardData(
      title: '图片与ICON',
      destinationBuilder: (context) => const ImagesAndIconPage(),
      markColor: Colors.deepPurple.shade400,
      category: ExampleCategory.basics,
    ),
    NavCardData(
      title: '开关与复选框',
      destinationBuilder: (context) => const SwitchAndCheckboxPage(),
      markColor: Colors.deepPurple.shade400,
      category: ExampleCategory.basics,
    ),
    NavCardData(
      title: '输入框',
      destinationBuilder: (context) => const InputPage(),
      markColor: Colors.deepPurple.shade800,
      category: ExampleCategory.basics,
    ),
    NavCardData(
      title: '表单',
      destinationBuilder: (context) => const FormPage(),
      markColor: Colors.deepPurple.shade800,
      category: ExampleCategory.basics,
    ),
    NavCardData(
      title: '进度条',
      destinationBuilder: (context) => const ProgressPage(),
      markColor: Colors.deepPurple.shade400,
      category: ExampleCategory.basics,
    ),
    // 布局类组件
    NavCardData(
      title: '线性布局',
      destinationBuilder: (context) => const RowColumnPage(),
      markColor: Colors.deepPurple.shade200,
      category: ExampleCategory.layout,
    ),
    NavCardData(
      title: '弹性布局',
      destinationBuilder: (context) => const FlexPage(),
      markColor: Colors.deepPurple.shade400,
      category: ExampleCategory.layout,
    ),
    NavCardData(
      title: '流式布局',
      destinationBuilder: (context) => const WrapPage(),
      markColor: Colors.deepPurple.shade400,
      category: ExampleCategory.layout,
    ),
    NavCardData(
      title: '层叠布局',
      destinationBuilder: (context) => const StackPage(),
      markColor: Colors.deepPurple.shade800,
      category: ExampleCategory.layout,
    ),
    NavCardData(
      title: '对齐与相对定位',
      destinationBuilder: (context) => const AlignPage(),
      markColor: Colors.deepPurple.shade400,
      category: ExampleCategory.layout,
    ),
    // 容器类组件
    NavCardData(
      title: '填充',
      destinationBuilder: (context) => const PaddingPage(),
      markColor: Colors.deepPurple.shade200,
      category: ExampleCategory.container,
    ),
    NavCardData(
      title: '容器 Container',
      destinationBuilder: (context) => const ContainerPage(),
      markColor: Colors.deepPurple.shade400,
      category: ExampleCategory.container,
    ),
    // 可滚动组件
    NavCardData(
      title: 'SingleChildScrollView',
      destinationBuilder: (context) => const SingleChildScrollViewPage(),
      markColor: Colors.deepPurple.shade200,
      category: ExampleCategory.scrollable,
    ),
    NavCardData(
      title: 'ListView',
      destinationBuilder: (context) => const ListViewPage(),
      markColor: Colors.deepPurple.shade400,
      category: ExampleCategory.scrollable,
    ),
    NavCardData(
      title: 'ListView.builder',
      destinationBuilder: (context) => const ListViewBuilderPage(),
      markColor: Colors.deepPurple.shade400,
      category: ExampleCategory.scrollable,
    ),
    NavCardData(
      title: 'ListView.separated',
      destinationBuilder: (context) => const ListViewSeparatedPage(),
      markColor: Colors.deepPurple.shade400,
      category: ExampleCategory.scrollable,
    ),
    // 未分类
    NavCardData(
      title: '空白页',
      destinationBuilder: (context) => const EmptyPage(),
      markColor: Colors.blueGrey.shade300,
      category: ExampleCategory.unclassified,
    ),
    NavCardData(
      title: '页面传输数据',
      destinationBuilder: (context) => const PageReturnDataPageA(),
      markColor: Colors.blueGrey.shade300,
      category: ExampleCategory.unclassified,
    ),
    NavCardData(
      title: '请求百度首页',
      destinationBuilder: (context) => const RequestBaiduPage(),
      markColor: Colors.blueGrey.shade300,
      category: ExampleCategory.unclassified,
    ),
  ];

  /// 所有分类（包含"全部"选项）
  static const List<ExampleCategory?> categories = [
    null,
    ...ExampleCategory.values,
  ];

  /// 根据分类获取数据，category 为 null 时返回全部
  static List<NavCardData> getItemsByCategory(ExampleCategory? category) {
    if (category == null) return items;
    return items.where((e) => e.category == category).toList();
  }
}
