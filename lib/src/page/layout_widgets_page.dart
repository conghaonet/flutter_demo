import 'package:flutter/material.dart';
import 'package:flutter_demo/src/page/web_view_page.dart';
import 'package:go_router/go_router.dart';

import '../my_util.dart' as util;

class LayoutWidgetsPage extends StatefulWidget {
  static const pagePathName = 'layout_widgets';
  const LayoutWidgetsPage({Key? key}) : super(key: key);

  @override
  State<LayoutWidgetsPage> createState() => _LayoutWidgetsPageState();
}

class _LayoutWidgetsPageState extends State<LayoutWidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout widgets'),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text('Single-child layout widgets', style: TextStyle(fontSize: 20,),),
          ),
          ..._buildSingleChildLayoutWidgets(),
          Container(
            margin: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text('Multi-child layout widgets', style: TextStyle(fontSize: 20,),),
          ),
          ..._buildMultiChildLayoutWidgets(),
          Container(
            margin: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text('Sliver widgets', style: TextStyle(fontSize: 20,),),
          ),
          ..._buildSliverWidgets(),
        ],
      ),
    );
  }

  List<Widget> _buildSingleChildLayoutWidgets() {
    return [
      _buildItem('Align',
        subTitle: "A widget that aligns its child within itself and optionally sizes itself based on the child's size.",
        link: 'https://api.flutter-io.cn/flutter/widgets/Align-class.html',
      ),
      _buildItem('AspectRatio',
        subTitle: "A widget that attempts to size the child to a specific aspect ratio.",
        link: 'https://api.flutter-io.cn/flutter/widgets/AspectRatio-class.html',
      ),
      _buildItem('Baseline',
        subTitle: "A widget that positions its child according to the child's baseline.",
        link: 'https://api.flutter-io.cn/flutter/widgets/Baseline-class.html',
      ),
      _buildItem('Center',
        subTitle: "A widget that centers its child within itself.",
        link: 'https://api.flutter-io.cn/flutter/widgets/Center-class.html',
      ),
      _buildItem('ConstrainedBox',
        subTitle: "A widget that imposes additional constraints on its child.",
        link: 'https://api.flutter-io.cn/flutter/widgets/ConstrainedBox-class.html',
      ),
      _buildItem('Container',
        subTitle: "A convenience widget that combines common painting, positioning, and sizing widgets.",
        link: 'https://api.flutter-io.cn/flutter/widgets/Container-class.html',
      ),
      _buildItem('CustomSingleChildLayout',
        subTitle: "A widget that defers the layout of its single child to a delegate.",
        link: 'https://api.flutter-io.cn/flutter/widgets/CustomSingleChildLayout-class.html',
      ),
      _buildItem('Expanded',
        subTitle: "A widget that expands a child of a Row, Column, or Flex.",
        link: 'https://api.flutter-io.cn/flutter/widgets/Expanded-class.html',
      ),
      _buildItem('FittedBox',
        subTitle: "Scales and positions its child within itself according to fit.",
        link: 'https://api.flutter-io.cn/flutter/widgets/FittedBox-class.html',
      ),
      _buildItem('FractionallySizedBox',
        subTitle: "A widget that sizes its child to a fraction of the total available space. For more details about the layout algorithm, see RenderFractionallySizedOverflowBox.",
        link: 'https://api.flutter-io.cn/flutter/widgets/FractionallySizedBox-class.html',
      ),
      _buildItem('IntrinsicHeight',
        subTitle: "A widget that sizes its child to the child's intrinsic height.",
        link: 'https://api.flutter-io.cn/flutter/widgets/IntrinsicHeight-class.html',
      ),
      _buildItem('IntrinsicWidth',
        subTitle: "A widget that sizes its child to the child's intrinsic width.",
        link: 'https://api.flutter-io.cn/flutter/widgets/IntrinsicWidth-class.html',
      ),
      _buildItem('LimitedBox',
        subTitle: "A box that limits its size only when it's unconstrained.",
        link: 'https://api.flutter-io.cn/flutter/widgets/LimitedBox-class.html',
      ),
      _buildItem('Offstage',
        subTitle: "A widget that lays the child out as if it was in the tree, but without painting anything, without making the child available for hit...",
        link: 'https://api.flutter-io.cn/flutter/widgets/Offstage-class.html',
      ),
      _buildItem('OverflowBox',
        subTitle: "A widget that imposes different constraints on its child than it gets from its parent, possibly allowing the child to overflow the parent.",
        link: 'https://api.flutter-io.cn/flutter/widgets/OverflowBox-class.html',
      ),
      _buildItem('Padding',
        subTitle: "A widget that insets its child by the given padding.",
        link: 'https://api.flutter-io.cn/flutter/widgets/Padding-class.html',
      ),
      _buildItem('SizedBox',
        subTitle: "A box with a specified size. If given a child, this widget forces its child to have a specific width and/or height (assuming values are...",
        link: 'https://api.flutter-io.cn/flutter/widgets/SizedBox-class.html',
      ),
      _buildItem('SizedOverflowBox',
        subTitle: "A widget that is a specific size but passes its original constraints through to its child, which will probably overflow.",
        link: 'https://api.flutter-io.cn/flutter/widgets/SizedOverflowBox-class.html',
      ),
      _buildItem('Transform',
        subTitle: "A widget that applies a transformation before painting its child.",
        link: 'https://api.flutter-io.cn/flutter/widgets/Transform-class.html',
      ),
    ];
  }

  List<Widget> _buildMultiChildLayoutWidgets() {
    return [
      _buildItem('Column',
        subTitle: "Layout a list of child widgets in the vertical direction.",
        link: 'https://api.flutter-io.cn/flutter/widgets/Column-class.html',
      ),
      _buildItem('CustomMultiChildLayout',
        subTitle: "A widget that uses a delegate to size and position multiple children.",
        link: 'https://api.flutter-io.cn/flutter/widgets/CustomMultiChildLayout-class.html',
      ),
      _buildItem('Flow',
        subTitle: "A widget that implements the flow layout algorithm.",
        link: 'https://api.flutter-io.cn/flutter/widgets/Flow-class.html',
      ),
      _buildItem('GridView',
        subTitle: "A grid list consists of a repeated pattern of cells arrayed in a vertical and horizontal layout. The GridView widget implements this component.",
        link: 'https://api.flutter-io.cn/flutter/widgets/GridView-class.html',
      ),
      _buildItem('IndexedStack',
        subTitle: "A Stack that shows a single child from a list of children.",
        link: 'https://api.flutter-io.cn/flutter/widgets/IndexedStack-class.html',
      ),
      _buildItem('LayoutBuilder',
        subTitle: "Builds a widget tree that can depend on the parent widget's size.",
        link: 'https://api.flutter-io.cn/flutter/widgets/LayoutBuilder-class.html',
      ),
      _buildItem('ListBody',
        subTitle: "A widget that arranges its children sequentially along a given axis, forcing them to the dimension of the parent in the other axis.",
        link: 'https://api.flutter-io.cn/flutter/widgets/ListBody-class.html',
      ),
      _buildItem('ListView',
        subTitle: "A scrollable, linear list of widgets. ListView is the most commonly used scrolling widget. It displays its children one after another in the scroll direction....",
        link: 'https://api.flutter-io.cn/flutter/widgets/ListView-class.html',
      ),
      _buildItem('Row',
        subTitle: "Layout a list of child widgets in the horizontal direction.",
        link: 'https://api.flutter-io.cn/flutter/widgets/Row-class.html',
      ),
      _buildItem('Stack',
        subTitle: "This class is useful if you want to overlap several children in a simple way, for example having some text and an image, overlaid with...",
        link: 'https://api.flutter-io.cn/flutter/widgets/Stack-class.html',
      ),
      _buildItem('Table',
        subTitle: "A widget that uses the table layout algorithm for its children.",
        link: 'https://api.flutter-io.cn/flutter/widgets/Table-class.html',
      ),
      _buildItem('Wrap',
        subTitle: "A widget that displays its children in multiple horizontal or vertical runs.",
        link: 'https://api.flutter-io.cn/flutter/widgets/Wrap-class.html',
      ),
    ];
  }

  List<Widget> _buildSliverWidgets() {
    return [
      _buildItem('CupertinoSliverNavigationBar',
        subTitle: "An iOS-styled navigation bar with iOS-11-style large titles using slivers.",
        link: 'https://api.flutter-io.cn/flutter/cupertino/CupertinoSliverNavigationBar-class.html',
      ),
      _buildItem('CustomScrollView',
        subTitle: "A ScrollView that creates custom scroll effects using slivers.",
        link: 'https://api.flutter-io.cn/flutter/widgets/CustomScrollView-class.html',
      ),
      _buildItem('SliverAppBar',
        subTitle: "A material design app bar that integrates with a CustomScrollView.",
        link: 'https://api.flutter-io.cn/flutter/material/SliverAppBar-class.html',
      ),
      _buildItem('SliverChildBuilderDelegate',
        subTitle: "A delegate that supplies children for slivers using a builder callback.",
        link: 'https://api.flutter-io.cn/flutter/widgets/SliverChildBuilderDelegate-class.html',
      ),
      _buildItem('SliverChildListDelegate',
        subTitle: "A delegate that supplies children for slivers using an explicit list.",
        link: 'https://api.flutter-io.cn/flutter/widgets/SliverChildListDelegate-class.html',
      ),
      _buildItem('SliverFixedExtentList',
        subTitle: "A sliver that places multiple box children with the same main axis extent in a linear array.",
        link: 'https://api.flutter-io.cn/flutter/widgets/SliverFixedExtentList-class.html',
      ),
      _buildItem('SliverGrid',
        subTitle: "A sliver that places multiple box children in a two dimensional arrangement.",
        link: 'https://api.flutter-io.cn/flutter/widgets/SliverGrid-class.html',
      ),
      _buildItem('SliverList',
        subTitle: "A sliver that places multiple box children in a linear array along the main axis.",
        link: 'https://api.flutter-io.cn/flutter/widgets/SliverList-class.html',
      ),
      _buildItem('SliverPadding',
        subTitle: "A sliver that applies padding on each side of another sliver.",
        link: 'https://api.flutter-io.cn/flutter/widgets/SliverPadding-class.html',
      ),
      _buildItem('SliverPersistentHeader',
        subTitle: "A sliver whose size varies when the sliver is scrolled to the edge of the viewport opposite the sliver's GrowthDirection.",
        link: 'https://api.flutter-io.cn/flutter/widgets/SliverPersistentHeader-class.html',
      ),
      _buildItem('SliverToBoxAdapter',
        subTitle: "A sliver that contains a single box widget.",
        link: 'https://api.flutter-io.cn/flutter/widgets/SliverToBoxAdapter-class.html',
      ),
    ];
  }

  Widget _buildItem(String title, {String? subTitle, String? link}) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: util.isNullOrBlank(subTitle) ? null : Text(subTitle!),
        onTap: util.isNullOrBlank(link) ? null : () {
          GoRouter.of(context).push('/${WebViewPage.pagePathName}?title=$title&link=$link');
        },
        enabled: !util.isNullOrBlank(link),
      ),
    );
  }
}
