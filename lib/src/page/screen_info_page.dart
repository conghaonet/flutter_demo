import 'package:flutter/material.dart';
import 'dart:ui' as ui show window;

class ScreenInfoPage extends StatefulWidget {
  static const pagePathName = 'device_info';
  const ScreenInfoPage({Key? key}) : super(key: key);

  @override
  State<ScreenInfoPage> createState() => _ScreenInfoPageState();
}

class _ScreenInfoPageState extends State<ScreenInfoPage> with WidgetsBindingObserver {
  MediaQueryData _mediaQuery = MediaQueryData.fromWindow(ui.window);
  static const dividerHeight = 16.0;

  @override
  void initState() {
    /// 相应的需要在dispose()中，调用 WidgetsBinding.instance.removeObserver(this)
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeMetrics() {
    setState(() {
      _mediaQuery = MediaQueryData.fromWindow(ui.window);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('屏幕尺寸信息'),
      ),
      body: ListView(
        children: [
          Text('状态栏高度：${_mediaQuery.padding.top}'),
          const Divider(height: dividerHeight,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(builder: (context) {
                /// 不要使用MediaQuery.of(context)获取屏幕信息，context的位置不同，会导致结果不一致。
                return Text('状态栏高度（错误示范）：${MediaQuery.of(context).padding.top}');
              }),
              const Text('''不要使用MediaQuery.of(context)获取屏幕信息，
context的位置不同，会导致结果不一致。''', style: TextStyle(fontSize: 12),),
            ],
          ),
          const Divider(height: dividerHeight,),
          Text('底部系统导航栏高度：${_mediaQuery.padding.bottom}'),
          const Divider(height: dividerHeight,),
          Text('像素密度：${_mediaQuery.devicePixelRatio}'),
          const Divider(height: dividerHeight,),
          Text('屏幕逻辑像素(宽x高)：${_mediaQuery.size.width} x ${_mediaQuery.size.height}'),
          const Divider(height: dividerHeight,),
          Text('屏幕真实像素(宽x高)：${_mediaQuery.devicePixelRatio * _mediaQuery.size.width} x ${_mediaQuery.devicePixelRatio * _mediaQuery.size.height}'),
          const Divider(height: dividerHeight,),
          Text('屏幕方向：${_mediaQuery.orientation}'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
