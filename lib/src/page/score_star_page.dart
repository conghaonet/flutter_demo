import 'package:flutter/material.dart';
import 'package:flutter_demo/src/widget/score_star.dart';
import 'dart:math' as math;

class ScoreStarPage extends StatefulWidget {
  static const pagePathName = 'score_star';
  const ScoreStarPage({Key? key}) : super(key: key);

  @override
  State<ScoreStarPage> createState() => _ScoreStarPageState();
}

/// 状态栏高度
class _ScoreStarPageState extends State<ScoreStarPage> {
  double? _height;
  double? _width;
  double _score = 3.5;

  void _changeScore(BuildContext ctx, Offset offset) {
    Size size = ctx.size ?? Size.zero;
    double offsetX = math.min(offset.dx, size.width);
    offsetX = math.max(0, offsetX);
    setState(() {
      _score = double.parse(((offsetX / size.width) * 5).toStringAsFixed(1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自定义评分'),
      ),
      persistentFooterButtons: _buildFooterButtons(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Placeholder(child: SizedBox(height: 40, width: double.infinity,),),
            Container(width: double.infinity, height: 33, color: Colors.lightBlue,),
            const ScoreStar(score: 3,),
            Row(
              children: const [
                Text('自定义'),
                Expanded(
                  child: ScoreStar(score: 3,),
                ),
              ],
            ),
            const SizedBox(height: 40,),
            Container(
              width: _width,
              height: _height,
              color: Colors.lightBlue,
              child: Builder(builder: (ctx) {
                return GestureDetector(
                  child: ScoreStar(score: _score,),
                  onTapDown: (details) => _changeScore(ctx, details.localPosition),
                  onHorizontalDragUpdate: (details) => _changeScore(ctx, details.localPosition),
                );
              },),
            ),
            const Text('点击或横向滑动以改变评分'),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFooterButtons() {
    return [
      OutlinedButton(
        onPressed: _height == null ? null : () {
          setState(() {
            _height = _height! + 10;
          });
        },
        child: const Text('高度+10'),
      ),
      OutlinedButton(
        onPressed: _width == null ? null : () {
          setState(() {
            _width = _width! + 10;
          });
        },
        child: const Text('宽度+10'),
      ),
      OutlinedButton(
        onPressed: () {
          setState(() {
            _width = 50;
            _height = 50;
          });
        },
        child: const Text('50x50'),
      ),
      OutlinedButton(
        onPressed: () {
          setState(() {
            _width = null;
            _height = null;
          });
        },
        child: const Text('最大'),
      ),
    ];
  }
}
