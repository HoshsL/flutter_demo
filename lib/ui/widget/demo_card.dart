import 'package:flutter/material.dart';

class DemoCard extends StatelessWidget {
  const DemoCard({super.key, required this.cardTitle, required this.children});

  final String cardTitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
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
            offset: Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
      margin: EdgeInsets.all(10.0),
      child: Padding(
        //上下留空
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          // 左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 12.0),
              child: Text(
                cardTitle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9E9E9E),
                  // 加宽字间距
                  letterSpacing: 1.0,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: children.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: children[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
