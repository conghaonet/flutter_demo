import 'package:flutter/material.dart';
import 'dart:math' as math;

class ScrollToIndexPage extends StatefulWidget {
  static const pagePathName = 'scroll_to_index';
  const ScrollToIndexPage({Key? key}) : super(key: key);

  @override
  State<ScrollToIndexPage> createState() => _ScrollToIndexPageState();
}

class _ScrollToIndexPageState extends State<ScrollToIndexPage> {
  static const maxCount = 1000;
  final _scrollViewKey = GlobalKey();
  final ScrollController _scrollViewController = ScrollController();
  final List<ItemModel> _dataList = List.generate(maxCount, (index) => ItemModel(index));
  final List<double> _itemHeightList = List.generate(
    maxCount,
    growable: false,
    (index) => (200 * math.Random().nextDouble()),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('滚动到指定位置'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          key: _scrollViewKey,
          restorationId: 'scroll_to_index',
          controller: _scrollViewController,
          child: Column(
            children: List.generate(maxCount, (index) {
              return Card(
                key: _dataList[index].globalKey,
                  child: SizedBox(
                    height: math.max(_itemHeightList[index], 50),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Item ${_dataList[index].index}'),
                    ),
                  ),
              );
            }),
          ),
        ),
      ),
      persistentFooterButtons: [
        MaterialButton(
          color: Theme.of(context).colorScheme.inversePrimary,
          child: const Text('Go to 12'),
          onPressed: () {
            final RenderBox renderBox = _dataList[12].globalKey.currentContext!.findRenderObject() as RenderBox;
            ///获取位置偏移，基于 ancestor: SingleChildScrollView 的 RenderObject()
            double dy = renderBox.localToGlobal(
                Offset.zero,
                ancestor: _scrollViewKey.currentContext!.findRenderObject()
            ).dy;

            ///计算真实位移
            var offset = dy + _scrollViewController.offset;

            debugPrint("******* offset=$offset");
            _scrollViewController.animateTo(offset,
                duration: const Duration(milliseconds: 500), curve: Curves.linear);
          },
        ),
      ],
    );
  }
}

class ItemModel {
  ///这个key是关键
  final GlobalKey globalKey = GlobalKey();
  ///可以添加你的代码
  final int index;
  ItemModel(this.index);
}