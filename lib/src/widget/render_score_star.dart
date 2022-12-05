import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class RenderScoreStar extends RenderBox {
  Color _backgroundColor;
  Color get backgroundColor => _backgroundColor;
  set backgroundColor(Color value) {
    if(_backgroundColor == value) {
      return;
    }
    _backgroundColor = value;
    markNeedsPaint();
  }

  Color _foregroundColor;
  Color get foregroundColor => _foregroundColor;
  set foregroundColor(Color value) {
    if(_foregroundColor == value) {
      return;
    }
    _foregroundColor = value;
    markNeedsPaint();
  }

  double _score;
  double get score => _score;
  set score(double value) {
    if (_score == value) {
      return;
    }

    _score = value;
    /// 由于 _score 变化不会引起 layout 变化，故此处只需调用 markNeedsPaint，
    /// 若会引起 layout 变化，则需要调用 markNeedsLayout
    markNeedsPaint();
  }

  RenderScoreStar(this._backgroundColor, this._foregroundColor, this._score);

  /// 在本例中设为 true or false 都可以，因为 RenderScoreStar#size 完全由 constraints 决定。
  /// 从性能角度考虑，sizedByParent 应设为 true，以便满足 RepaintBoundary 的条件。
  /// 若 sizedByParent 设为 true，需要重写 performResize 方法来计算 size，
  /// 由于 RenderScoreStar 没有 layout 操作需要执行，故不需要重写performLayout。
  /// 若 sizedByParent 设为 false，则需要重写 performLayout，并在该方法中完成 size 的计算。
  @override
  bool get sizedByParent => false;

  @override
  void performLayout() {
    double height = math.min(constraints.biggest.height, constraints.biggest.width / 5);
    height = math.max(height, constraints.smallest.height);
    size = Size(constraints.biggest.width, height);
  }

/// @override
/// bool get sizedByParent => true;
///
/// @override
/// void performResize() {
///   double height = math.min(constraints.biggest.height, constraints.biggest.width / 5);
///   height = math.max(height, constraints.smallest.height);
///   size = Size(constraints.biggest.width, height);
/// }

  /// 用于计算一个最小宽度(没错，是最小宽度)，在最终 size.width 超过该宽度时，
  /// 也不会减少 size.height (如，对 text 排版，将 text 排成一行需要的最小宽度就是这里的 MaxIntrinsicWidth，
  /// 因为再增加宽度也不会减少 text 的高度)；
  /// 在一些特殊 RenderObject 排版时才会用到这些方法，在此我们根据 constraints 简单计算了一下。
  @override
  double computeMaxIntrinsicWidth(double height) {
    return constraints.biggest.width;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    double height = math. min(constraints.biggest.height, constraints.biggest.width / 5);
    height = math.max(height, constraints.smallest.height);
    return height;
  }

  /// 返回true，表示该 Render Object 需要响应用户事件
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    _starPainter(context, offset, backgroundColor);

    context.pushClipRect(
        needsCompositing,
        offset,
        Rect.fromLTRB(0, 0, size.width * score / 5, size.height),
        (context, offset) {
          _starPainter(context, offset, foregroundColor);
        }
    );
  }

  void _starPainter(PaintingContext context, Offset offset, Color color) {
    Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;

    double radius = math.min(size.height / 2, size.width/ (2 * 5));

    Path path = Path();
    _addStarLine(radius, path);
    for (int i = 0; i < 4; i++) {
      path = path.shift(Offset(radius * 2, 0.0));
      _addStarLine(radius, path);
    }

    path = path.shift(offset);
    path.close();

    context.canvas.drawPath(path, paint);
  }

  void _addStarLine(double radius, Path path) {
    double radian = (math.pi * 36) / 180;

    double sinRadian = math.sin(radian);
    double sinHalfRadian = math.sin(radian / 2);

    double cosRadian = math.cos(radian);
    double cosHalfRadian = math.cos(radian / 2);

    double innerRadius = (radius * sinHalfRadian / cosRadian);

    path.moveTo((radius * cosHalfRadian), 0.0);
    path.lineTo((radius * cosHalfRadian + innerRadius * sinRadian), (radius - radius * sinHalfRadian));
    path.lineTo((radius * cosHalfRadian * 2), (radius - radius * sinHalfRadian));
    path.lineTo((radius * cosHalfRadian + innerRadius * cosHalfRadian), (radius + innerRadius * sinHalfRadian));
    path.lineTo((radius * cosHalfRadian + radius * sinRadian), (radius + radius * cosRadian));
    path.lineTo((radius * cosHalfRadian), (radius + innerRadius));
    path.lineTo((radius * cosHalfRadian - radius * sinRadian), (radius + radius * cosRadian));
    path.lineTo((radius * cosHalfRadian - innerRadius * cosHalfRadian), (radius + innerRadius * sinHalfRadian));
    path.lineTo(0.0, (radius - radius * sinHalfRadian));
    path.lineTo((radius * cosHalfRadian- innerRadius * sinRadian), (radius - radius * sinHalfRadian));
  }
}