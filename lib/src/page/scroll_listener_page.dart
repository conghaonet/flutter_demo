import 'package:flutter/material.dart';

class ScrollListenerPage extends StatefulWidget {
  static const pagePathName = 'scroll_listener';
  const ScrollListenerPage({Key? key}) : super(key: key);

  @override
  State<ScrollListenerPage> createState() => _ScrollListenerPageState();
}

class _ScrollListenerPageState extends State<ScrollListenerPage> {
  final _controller = ScrollController();
  double _positionPixels = 0;
  String _notify = "";
  bool _isEnd = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _positionPixels = _controller.position.pixels;
        _isEnd = _positionPixels == _controller.position.maxScrollExtent;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScrollListenerPage'),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollEndNotification) {
            /// 滚动结束
            _notify = "ScrollEnd";
          } else if (notification is ScrollStartNotification) {
            /// 将要开始滚动，是否真的可以滚动要看[ScrollUpdateNotification]
            _notify = "ScrollStart";
          } else if (notification is UserScrollNotification) {
            _notify = " UserScroll";
          } else if (notification is ScrollUpdateNotification) {
            /// 滚动中
            _notify = "ScrollUpdate";
          }
          setState(() {});
          return false;
        },
        child: ListView.builder(
          restorationId: 'scroll_listener',
          physics: const AlwaysScrollableScrollPhysics(), // controller为null时，默认为 AlwaysScrollableScrollPhysics
          controller: _controller, // controller为 null 时，physics 默认为 AlwaysScrollableScrollPhysics
          itemCount: 99,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Item $index'),
              ),
            );
          },
        ),
      ),
      persistentFooterButtons: <Widget>[
        Text(_isEnd ? '到底了' : ''),
        Text(_notify),
        Text('Position: ${_positionPixels.toInt()}'),
        MaterialButton(
          color: Theme.of(context).colorScheme.secondary,
          onPressed: _positionPixels == 0 ? null : () {
            _controller.animateTo(0,
              duration: const Duration(seconds: 1),
              curve: Curves.bounceInOut,
            );
          },
          child: const Text('Top'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
