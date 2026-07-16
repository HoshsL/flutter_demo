import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/page/unclassified/page_return_data_page_b.dart';

class PageReturnDataPageA extends StatefulWidget {
  const PageReturnDataPageA({super.key});

  @override
  State<PageReturnDataPageA> createState() => _PageReturnDataPageAState();
}

class _PageReturnDataPageAState extends State<PageReturnDataPageA> {
  String _text = '等待';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '接受数据页',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('在下个页面输入的是： \n $_text', style: TextStyle(fontSize: 18)),
            ElevatedButton(
              onPressed: () async {
                String? res = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PageReturnDataPageB(),
                  ),
                );
                setState(() {
                  _text = res ?? _text;
                });
              },
              child: Text('传送'),
            ),
          ],
        ),
      ),
    );
  }
}
