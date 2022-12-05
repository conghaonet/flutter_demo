import 'package:flutter/material.dart';
import 'package:flutter_demo/src/widget/render_score_star.dart';

class ScoreStar extends LeafRenderObjectWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final double score;

  const ScoreStar({
    super.key,
    this.backgroundColor = Colors.grey,
    this.foregroundColor = Colors.yellowAccent,
    this.score = 0.0
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderScoreStar(backgroundColor, foregroundColor, score);
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderScoreStar renderObject) {
    renderObject
      ..backgroundColor = backgroundColor
      ..foregroundColor = foregroundColor
      ..score = score;
  }
}
