import 'package:flutter/material.dart';
import 'package:flutter_demo/src/widget/score_star.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自定义评分'),
      ),
      persistentFooterButtons: [
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
      ],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Placeholder(child: SizedBox(height: 40, width: double.infinity,),),
            Container(
              width: _width,
              height: _height,
              color: Colors.blue,
              child: const ScoreStar(score: 3.5,),
            ),
          ],
        ),
      ),
    );
  }
}
