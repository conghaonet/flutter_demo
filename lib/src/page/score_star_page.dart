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
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).systemGestureInsets;
    return Material(
      child: SafeArea(
        child: Column(
          children: const [
            Placeholder(child: SizedBox(height: 40, width: double.infinity,),),
            ScoreStar(score: 3.5,),
          ],
        ),
      ),
    );
  }
}
