import 'package:flutter/material.dart';

class FloatingTouchPage extends StatefulWidget {
  static const pagePathName = 'floating_touch';
  const FloatingTouchPage({Key? key}) : super(key: key);

  @override
  State<FloatingTouchPage> createState() => _FloatingTouchPageState();
}

class _FloatingTouchPageState extends State<FloatingTouchPage> {
  Offset _offset = const Offset(100, 200);
  static const double radius = 40;
  OverlayEntry? _overlayEntry;
  bool _overlayIsMounted = false;


  ///显示悬浮控件
  void _showFloating() {
    _overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        left: _offset.dx,
        top: _offset.dy,
        child: _buildFloating(),
      );
    });
    _overlayEntry?.addListener(() {
      if(!_overlayEntry!.mounted) _overlayIsMounted = false;
      debugPrint('_overlayEntry has been removed.');
    });
    ///插入全局悬浮控件
    Overlay.of(context)!.insert(_overlayEntry!);
    _overlayIsMounted = true;
  }

  Widget _buildFloating() {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onPanDown: (details) {
        _offset = details.globalPosition - const Offset(radius, radius);
        _overlayEntry!.markNeedsBuild();
      },
      onPanUpdate: (DragUpdateDetails details) {
        ///根据触摸修改悬浮控件偏移
        _offset += details.delta;
        _overlayEntry!.markNeedsBuild();
      },
      onLongPress: () {
        _overlayEntry!.remove();
      },
      child: Material(
        color: Colors.transparent,
        child: Builder(builder: (context) {
          return Container(
            height: radius * 2,
            width: radius * 2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(radius)),
            ),
            child: const Text('长按\n移除', style: TextStyle(color: Colors.white),),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('全局悬浮按钮'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            if(!_overlayIsMounted) _showFloating();
          },
          child: Builder(builder: (context) {
            return const Text('显示悬浮按钮',);
          }),
        ),
      ),
    );
  }
}
