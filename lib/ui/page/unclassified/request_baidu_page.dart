import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RequestBaiduPage extends StatefulWidget {
  const RequestBaiduPage({super.key});

  @override
  State<RequestBaiduPage> createState() => _RequestBaiduPageState();
}

class _RequestBaiduPageState extends State<RequestBaiduPage> {
  // 创建一个 Response 的Future对象
  late Future<Response> _res;
  // 创建网络请求对象
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    // 这里不用await，我们就是想把Future保留下来
    // 其实是因为initState不能被标记为async方法，不信大家试试，会报错
    // 这次我们取得Future中数据的方法是使用FutureBuilder组件，请大家继续往下看
    _res = _dio.get('https://www.baidu.com/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          '请求百度首页',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Center(
        // 还记得这个组件吗，因为HTML很长，我们需要滚动才能显示完全
        child: SingleChildScrollView(
          child: FutureBuilder(
            // 我们的Future对象在这里派上用场
            // FutureBuilder的future属性接受一个Future类型，我们的_res刚好是Future类型，直接传进去
            future: _res,

            builder: (context, snapshot) {
              // 我们需要在builder中返回我们想展示的组件
              // builder的两个参数第一个不用多说，就是一个BuildContext
              // 第二个参数是我们先前传进去的Future对象的信息

              // 比如下面的if语句
              // snapshot.connectionState储存了当前Future的执行状态
              // 如果执行完了就会等于ConnectionState.done
              // 我们这里判断是否执行完毕，如果没有就显示一个加载动画
              if (snapshot.connectionState != ConnectionState.done) {
                return CircularProgressIndicator();
              } else {
                // 执行完了，我们就可以通过snapshot.data来获取Future中的数据了
                // 后面那个data是Response的属性，存储着服务器端发来的数据，在此处就是一个HTML
                return Text(snapshot.data!.data);
              }
            },
          ),
        ),
      ),
    );
  }
}
