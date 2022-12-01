import 'package:flutter/material.dart';

class FutureBuilderPage extends StatelessWidget {
  static const pagePathName = 'future_builder';
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('防止FutureBuilder重复刷新'),
      ),
      body: Container(

      ),
    );
  }
}
