import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageStaet();
}

class _InputPageStaet extends State<InputPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  // 这里分别用两种形式演示实现监听文本变化
  @override
  void initState() {
    _pwdController.addListener(() {
      print('新的密码是${_pwdController.text}');
    });
    _usernameFocusNode.addListener(() {
      print(_usernameFocusNode.hasFocus ? '用户名框获得焦点' : '用户名框失去焦点');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '输入框',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Column(
        children: [
          TextField(
            autofocus: true,
            controller: _usernameController,
            focusNode: _usernameFocusNode,
            // 这里分别用两种形式演示实现监听文本变化
            onChanged: (value) {
              print('新的用户名是$value');
            },
            decoration: InputDecoration(
              labelText: '用户名',
              hintText: '用户名或邮箱',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          TextField(
            controller: _pwdController,
            focusNode: _pwdFocusNode,
            decoration: InputDecoration(
              labelText: '密码',
              hintText: '您的登陆密码',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          Column(
            spacing: 12.0,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '您好${_usernameController.text}，您的密码是${_pwdController.text}',
                      ),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Text('获取输入框数据'),
              ),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(_usernameFocusNode);
                  _usernameController.text = 'Hello World!';
                  _usernameController.selection = TextSelection(
                    baseOffset: 3,
                    extentOffset: _usernameController.text.length,
                  );
                },
                child: Text('填充用户名并选中前三个之后的字符'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_usernameFocusNode.hasFocus) {
                    FocusScope.of(context).requestFocus(_pwdFocusNode);
                  } else {
                    FocusScope.of(context).requestFocus(_usernameFocusNode);
                  }
                },
                child: Text('移动焦点'),
              ),
              ElevatedButton(
                onPressed: () {
                  _usernameFocusNode.unfocus();
                  _pwdFocusNode.unfocus();
                },
                child: Text('隐藏键盘'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
