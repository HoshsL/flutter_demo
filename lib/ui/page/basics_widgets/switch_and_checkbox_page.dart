import 'package:flutter/material.dart';

class SwitchAndCheckboxPage extends StatefulWidget {
  const SwitchAndCheckboxPage({super.key});

  @override
  State<SwitchAndCheckboxPage> createState() => _SwitchAndCheckboxPageState();
}

class _SwitchAndCheckboxPageState extends State<SwitchAndCheckboxPage> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '开关与复选框',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: 12.0),
          child: Column(
            spacing: 24.0,
            children: [
              Switch(
                value: _switchSelected,
                onChanged: (value) {
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.blueGrey,
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
