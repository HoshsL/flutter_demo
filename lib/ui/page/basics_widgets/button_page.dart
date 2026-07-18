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
          padding: const EdgeInsetsGeometry.only(top: 12.0),
          child: Column(
            spacing: 12.0,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('按下了ElevatedButton'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Text("ElevatedButton"),
              ),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('按下了TextButton'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Text("TextButton"),
              ),
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('按下了OutlinedButton'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Text("OutlinedButton"),
              ),
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('按下了TextButton'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                icon: Icon(Icons.thumb_up),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("发送"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('按下了发送按钮'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("添加"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('按下了添加按钮'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
              TextButton.icon(
                icon: const Icon(Icons.info),
                label: const Text("详情"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('按下了详情按钮'),
                      duration: const Duration(seconds: 1),
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
