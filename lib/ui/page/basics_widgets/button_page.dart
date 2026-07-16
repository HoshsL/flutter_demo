import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '按钮',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 12.0),
          child: Column(
            spacing: 12.0,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('按下了ElevatedButton'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Text("ElevatedButton"),
              ),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('按下了TextButton'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Text("TextButton"),
              ),
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('按下了OutlinedButton'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Text("OutlinedButton"),
              ),
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('按下了TextButton'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                icon: Icon(Icons.thumb_up),
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.send),
                label: Text("发送"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('按下了发送按钮'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.add),
                label: Text("添加"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('按下了添加按钮'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
              TextButton.icon(
                icon: Icon(Icons.info),
                label: Text("详情"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('按下了详情按钮'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
