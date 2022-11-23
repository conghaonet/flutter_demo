import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  static const pagePathName = 'list_page';
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      restorationId: 'list_page',
      appBar: AppBar(
        title: const Text('list page'),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.tertiary,
      ),
    );
  }
}
