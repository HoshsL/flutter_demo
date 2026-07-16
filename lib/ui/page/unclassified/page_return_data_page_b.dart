import 'package:flutter/material.dart';

class PageReturnDataPageB extends StatefulWidget {
  const PageReturnDataPageB({super.key});

  @override
  State<PageReturnDataPageB> createState() => _PageReturnDataPageBState();
}

class _PageReturnDataPageBState extends State<PageReturnDataPageB> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '发送数据页',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(2, 4),
                    color: Colors.grey,
                    spreadRadius: 4,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  helperText: 'helperText',
                  hintText: '可以输入一些内容',
                  border: OutlineInputBorder(),
                ),
                controller: _controller,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop<String>(_controller.text);
              },
              child: Text('保存并返回'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    //最后要释放掉
    _controller.dispose();
    super.dispose();
  }
}
