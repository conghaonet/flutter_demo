import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';


class FutureBuilderPage extends StatefulWidget {
  static const pagePathName = 'future_builder';
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  State<FutureBuilderPage> createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Future<String>? _future;

  @override
  void initState() {
    super.initState();
    /// 避免FutureBuilder重复刷新，此处是关键。
    /// 将_future赋值给FutureBuilder.future，而不是_loadUrl函数。
    _future = _loadUrl('https://flutter.dev');
  }

  Future<String> _loadUrl(String url) async {
    debugPrint('==== start _loadUrl() ----');
    await Future.delayed(const Duration(seconds: 2));
    Future<HttpClientRequest> request = HttpClient().getUrl(Uri.parse(url));
    Future<HttpClientResponse> response = request.then((value) {
      return value.close();
    });
    return response.then((value) {
      return value.transform(utf8.decoder).join();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('防止FutureBuilder重复刷新'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              OutlinedButton(
                child: const Text('setState'),
                onPressed: () {
                  setState(() {});
                },
              ),
              OutlinedButton(
                child: const Text('百度'),
                onPressed: () {
                  _future =  _loadUrl('https://wap.baidu.com');
                  setState(() {});
                },
              ),
              OutlinedButton(
                child: const Text('头条'),
                onPressed: () {
                  _future =  _loadUrl('https://www.toutiao.com/');
                  setState(() {});
                },
              ),
            ],
          ),
          Container(height: 1, width: double.infinity, color: Colors.grey,),
          Expanded(
            child: FutureBuilder<String>(
              future: _future, /// 使用Future对象，而非Future函数，可以避免重复刷新
              initialData: '-= initial data =-',
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Text(DateTime.now().toString()),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(snapshot.data ?? 'snapshot.data is null'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
