import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '层叠布局',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Scrollbar(
        // 显示进度条
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Stack with Alignment (层叠与居中):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      color: Colors.grey.shade200,
                    ),
                    Container(width: 200, height: 200, color: Colors.blue),
                    Container(width: 100, height: 100, color: Colors.red),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                'Stack with Positioned (绝对定位):',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.grey.shade200,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      left: 20,
                      top: 20,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 20,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.blue,
                      ),
                    ),
                    Positioned(
                      left: 50,
                      right: 50,
                      top: 100,
                      bottom: 100,
                      child: Container(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
