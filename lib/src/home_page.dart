import 'package:flutter/material.dart';
import 'package:flutter_demo/src/page/animated_container_demo_page.dart';
import 'package:flutter_demo/src/page/clip_demo_page.dart';
import 'package:flutter_demo/src/page/layout_widgets_page.dart';
import 'package:flutter_demo/src/page/screen_info_page.dart';
import 'package:flutter_demo/src/page/floating_touch_page.dart';
import 'package:flutter_demo/src/page/future_builder_page.dart';
import 'package:flutter_demo/src/page/hit_test_behavior_page.dart';
import 'package:flutter_demo/src/page/image_cache_page.dart';
import 'package:flutter_demo/src/page/inherited_widget_demo_page.dart';
import 'package:flutter_demo/src/page/refresh_load_more_page.dart';
import 'package:flutter_demo/src/page/score_star_page.dart';
import 'package:flutter_demo/src/page/scroll_listener_page.dart';
import 'package:flutter_demo/src/page/scroll_to_index_page.dart';
import 'package:flutter_demo/src/page/scroll_to_index_page2.dart';
import 'package:flutter_demo/src/page/web_view_page.dart';
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
    "Layout Widgets": "/${LayoutWidgetsPage.pagePathName}",
    "网络图片缓存": '/${ImageCachePage.pagePathName}',
    "列表滚动监听": "/${ScrollListenerPage.pagePathName}",
    "滑动到指定位置": '/${ScrollToIndexPage.pagePathName}',
    "滑动到指定位置2": "/${ScrollToIndexPage2.pagePathName}",
    "下拉刷新+上拉加载更多": "/${RefreshLoadMorePage.pagePathName}",
    "全局悬浮按钮": "/${FloatingTouchPage.pagePathName}",
    "测试HitTestBehavior": "/${HitTestBehaviorPage.pagePathName}",
    "防止FutureBuilder重复请求数据": "/${FutureBuilderPage.pagePathName}",
    "Flutter化单例InheritedWidget": "/${InheritedWidgetDemoPage.pagePathName}",
    "多种圆角实现": "/${ClipDemoPage.pagePathName}",
    "AnimatedContainer": "/${AnimatedContainerDemoPage.pagePathName}",
    "屏幕尺寸信息": "/${ScreenInfoPage.pagePathName}",
    "自定义评分(LeafRenderObjectWidget)": "/${ScoreStarPage.pagePathName}",
    "WebViewPage": "/${WebViewPage.pagePathName}",
  };
  /// get_it, mobx, provider, flutter_bloc

}
