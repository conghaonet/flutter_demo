import 'package:flutter/material.dart';
import 'package:flutter_demo/src/page/image_cache_page.dart';
import 'package:flutter_demo/src/page/list_page.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.go(_items.entries.elementAt(index).value);
            },
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_items.entries.elementAt(index).key),
              ),

            ),
          );
        },
      ),
    );
  }
  
  static final Map<String, String> _items = {
    "网络图片缓存": '/${ImageCachePage.pagePathName}',
  "ListView": "/${ListPage.pagePathName}",
  "图片b": "image",
  "图片c": "image"
  };


}
