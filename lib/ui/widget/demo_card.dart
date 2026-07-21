import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/routes/nav_routes.dart';
import 'package:flutter_demo/enums/example_category.dart';
import 'package:flutter_demo/ui/widget/nav_card.dart';

class DemoCard extends StatefulWidget {
  const DemoCard({super.key});

  @override
  State<DemoCard> createState() => DemoCardState();
}

class DemoCardState extends State<DemoCard> {
  final _categoryScrollController = ScrollController();
  final _listScrollController = ScrollController();
  ExampleCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final categories = NavRoutes.categories;
    final filteredItems = NavRoutes.getItemsByCategory(_selectedCategory);

    return Container(
      // 限制宽度为屏幕的85%
      width: screenWidth * 0.85,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      margin: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 胶囊导航栏
            SizedBox(
              height: 40,
              child: FadingEdgeScrollView.fromScrollView(
                child: ListView.builder(
                  controller: _categoryScrollController,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category == _selectedCategory;
                    final label = category?.label ?? '全部';
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(label),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = category;
                          });
                        },
                        selectedColor: Theme.of(context).colorScheme.primary,
                        backgroundColor: Colors.grey.shade200,
                        labelStyle: TextStyle(
                          color: isSelected
                              ? Theme.of(context).colorScheme.onPrimary
                              : Colors.grey.shade700,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                        shape: const StadiumBorder(), // 胶囊形状
                        side: BorderSide.none, // 无边框
                        showCheckmark: false,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            // NavCard 列表
            Expanded(
              child: FadingEdgeScrollView.fromScrollView(
                child: ListView.builder(
                  controller: _listScrollController,
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  physics: const BouncingScrollPhysics(),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: NavCard(
                        title: item.title,
                        destination: item.destinationBuilder(context),
                        markColor: item.markColor,
                        category: item.category.label,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
