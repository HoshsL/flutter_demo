# flutter_demo

## 项目描述

该项目旨在帮助flutter初学者快速掌握常见控件的使用，项目为不同示例对应知识点进行分级以便根据自身情况学习。欢迎为项目贡献更多示例。

## 环境要求

flutter SDK >= 3.9.2  
Android SdkVersion >= 24  
Ohos SdkVersion >= 6.1.0(23)  

## 项目结构

```bash
lib  
├─api/                             # 存放与后端的接口  
├─ui/  
│   ├─page/                        # 子页面  
│   │     ├─basics_widgets/        # 演示基础组件
│   │     ├─container_widgets/     # 演示容器组件
│   │     ├─layout_widgets/        # 演示布局组件
│   │     ├─scrollable_widgets/    # 演示可滚动组件
│   │     ├─unclassified/          # 旧示例，暂未分级  
│   │     └─home_page.dart         # 主界面，导航页
│   └─widget/                      # 自定义组件  
└─main.dart                        # 应用入口
```

## 示例分级标准

| 分级 | 颜色代码 | 色条预览 | 适用场景 |
| --- | --- | --- | --- |
| 未定 | `Colors.blueGrey[300]` | <span style="display:inline-block; width:15px; height:15px; background-color:#90A4AE; margin-right:5px;"></span> `#90A4AE` | 未评估难度的知识点 |
| 简单 | `Colors.deepPurple[200]` | <span style="display:inline-block; width:15px; height:15px; background-color:#B39DDB; margin-right:5px;"></span> `#B39DDB` | 基础概念/易掌握内容 |
| 中等 | `Colors.deepPurple[400]` | <span style="display:inline-block; width:15px; height:15px; background-color:#7E57C2; margin-right:5px;"></span> `#7E57C2` | 常规逻辑/需练习掌握 |
| 困难 | `Colors.deepPurple[800]` | <span style="display:inline-block; width:15px; height:15px; background-color:#4527A0; margin-right:5px;"></span> `#4527A0` | 复杂逻辑/需深度理解 |

## 示例内容

| 示例名 | 所属类 | 文件名 | 难度分级 |
| --- | --- | --- | --- |
| 文本与样式 | 基础组件 | text_and_style_page.dart | 简单 |
| 按钮 | 基础组件 | button_page.dart | 简单 |
| 图片与ICON | 基础组件 | images_and_icon_page.dart | 普通 |
| 开关与复选框 | 基础组件 | switch_and_checkbox_page.dart | 普通 |
| 输入框 | 基础组件 | input_page.dart | 困难 |
| 表单 | 基础组件 | form_page.dart | 困难 |
| 进度条 | 基础组件 | progress_page.dart | 普通 |
| 线性布局 | 布局类组件 | row_column_page.dart | 简单 |
| 弹性布局 | 布局类组件 | flex_page.dart | 普通 |
| 流式布局 | 布局类组件 | wrap_page.dart | 普通 |
| 层叠布局 | 布局类组件 | stack_page.dart | 困难 |
| 对齐与相对定位 | 布局类组件 | align_page.dart | 普通 |
| 填充 | 容器类组件 | padding_page.dart | 简单 |
| 容器 Container | 容器类组件 | container_page.dart | 普通 |
| SingleChildScrollView | 可滚动组件 | single_child_scroll_view_page.dart | 简单 |
| ListView | 可滚动组件 | list_view_page.dart | 普通 |
| ListView.builder | 可滚动组件 | list_view_builder_page.dart | 普通 |
| ListView.separated | 可滚动组件 | list_view_separated_page.dart | 普通 |
