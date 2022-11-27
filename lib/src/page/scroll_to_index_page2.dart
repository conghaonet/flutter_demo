import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:scroll_to_index/scroll_to_index.dart';

class ScrollToIndexPage2 extends StatefulWidget {
  static const pagePathName = 'scroll_to_index2';
  const ScrollToIndexPage2({Key? key}) : super(key: key);

  @override
  State<ScrollToIndexPage2> createState() => _ScrollToIndexPage2State();
}

class _ScrollToIndexPage2State extends State<ScrollToIndexPage2> {
  static const maxCount = 1000;
  final _random = math.Random();
  late final List<double> _itemHeightList;
  late final AutoScrollController _autoScrollController;

  @override
  void initState() {
    super.initState();
    _itemHeightList = List.generate(
      maxCount,
      growable: false,
      (index) => math.max(200 * _random.nextDouble(), 50.0),
    );
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
      suggestedRowHeight: 100
    );
  }

  Widget _wrapScrollTag({required index, required child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      index: index,
      child: child,
      controller: _autoScrollController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('滑动到指定位置', style: TextStyle(fontSize: 18),),
            Text('使用 scroll_to_index package', style: TextStyle(fontSize: 13),),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          restorationId: 'scroll_to_index2',
          controller: _autoScrollController,
          scrollDirection: Axis.vertical,
          itemCount: maxCount,
          itemBuilder: (context, index) {
            return _wrapScrollTag(
              index: index,
              child: Card(
                child: SizedBox(
                  height: _itemHeightList[index],
                  child: Center(child: Text('Item $index')),
                ),
              ),
            );
          },
        ),
      ),
      persistentFooterButtons: <Widget>[
        TextButton(
          onPressed: () async {
            ///滑动到第13个的位置
            /// 仅当目标item得state不为空时，duration参数有效
            await _autoScrollController.scrollToIndex(
              200,
              duration: const Duration(milliseconds: 500),
              preferPosition: AutoScrollPosition.begin,
            );
          },
          child: const Text("滑动到：Item 200"),
        ),
        IconButton(
          icon: const Icon(Icons.vertical_align_top),
          onPressed: () async {
            await _autoScrollController.animateTo(
              _autoScrollController.position.minScrollExtent,
              duration: const Duration(seconds: 20),
              curve: Curves.bounceInOut,
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.vertical_align_bottom),
          onPressed: ()  {
            _autoScrollController.jumpTo(
              _autoScrollController.position.maxScrollExtent
            );
          },
        ),
      ],
    );
  }
}
