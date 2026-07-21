enum ExampleCategory {
  basics('基础组件'),
  layout('布局类组件'),
  container('容器类组件'),
  scrollable('可滚动组件'),
  unclassified('未分类');

  final String label;

  const ExampleCategory(this.label);

  static ExampleCategory fromValue(String label) {
    return ExampleCategory.values.firstWhere(
      (e) => e.label == label,
      orElse: () => ExampleCategory.unclassified,
    );
  }
}
