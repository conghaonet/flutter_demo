import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class SingleChildRenderObjectDemoPage extends StatefulWidget {
  static const pagePathName = 'single_child_render_object_demo';

  const SingleChildRenderObjectDemoPage({Key? key}) : super(key: key);

  @override
  State<SingleChildRenderObjectDemoPage> createState() => _SingleChildRenderObjectDemoPageState();
}

class _SingleChildRenderObjectDemoPageState extends State<SingleChildRenderObjectDemoPage> {
  Color _color = Colors.amberAccent;
  late math.Random _random;
  @override
  void initState() {
    _random = math.Random();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildRenderObjectWidget'),
      ),
      body: _MySingleChildWidget(
        color: _color,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _color = Color.fromARGB(255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256),);
              });
            },
            child: const Text('改变颜色', style: TextStyle(color: Colors.black),),
          ),
        ),
      ),
    );
  }
}

class _MySingleChildWidget extends SingleChildRenderObjectWidget {
  final Color color;
  const _MySingleChildWidget({
    super.child,
    required this.color
  });

  @override
  _MyRenderBox createRenderObject(BuildContext context) {
    return _MyRenderBox(color);
  }

  @override
  void updateRenderObject(BuildContext context, covariant _MyRenderBox renderObject) {
    renderObject.color = color;
  }
}

class _MyRenderBox extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  Color _color;
  _MyRenderBox(this._color);

  Color get color => _color;
  set color(Color c) {
    if(c != _color) {
      _color = c;
      markNeedsPaint();
    }
  }

  @override
  bool get sizedByParent => true;

  @override
  void performLayout() {
    BoxConstraints childConstraints = constraints;
    if(constraints.biggest.isInfinite) {
      childConstraints = constraints.copyWith(maxWidth: size.width, maxHeight: size.height);
    }
    child?.layout(childConstraints, parentUsesSize: false);
    /// [sizedByParent]为true时，不能在此给size赋值
    // size = constraints.biggest;
  }

  @override
  void performResize() {
    /// sizedByParent 为 true，在此给size赋值
    if(constraints.biggest.isFinite) {
      size = constraints.biggest;
    } else if(constraints.biggest.isInfinite) {
      double minSide = math.min(constraints.biggest.width, constraints.biggest.height);
      size = Size(minSide, minSide);
    } else {
      size = Size.zero;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    double radius = math.min(size.width, size.height) / 2;
    Offset center = Offset(offset.dx + size.width/2, offset.dy + size.height / 2);
    context.canvas.drawCircle(
      center,
      radius,
      Paint()..color = color,
    );
    if (child != null) {
      context.paintChild(child!, offset);
    }

  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return child?.hitTest(result, position: position) == true;
  }

}
