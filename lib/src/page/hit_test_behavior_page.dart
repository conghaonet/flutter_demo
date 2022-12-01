import 'package:flutter/material.dart';

class HitTestBehaviorPage extends StatefulWidget {
  static const pagePathName = 'hit_test_behavior_page';
  const HitTestBehaviorPage({Key? key}) : super(key: key);

  @override
  State<HitTestBehaviorPage> createState() => _HitTestBehaviorPageState();
}

class _HitTestBehaviorPageState extends State<HitTestBehaviorPage> {
  int _redCount = 0;
  int _blueCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HitTestBehavior'),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('请分别触摸红色、蓝色区域，\n以测试 HitTestBehavior', style: TextStyle(color: Colors.grey),),
              Stack(
                children: [
                  Listener(
                    behavior: HitTestBehavior.deferToChild,
                    onPointerDown: (event) {
                      setState(() {
                        ++_blueCount;
                      });
                    },
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(300.0, 200.0)),
                      child: const DecoratedBox(decoration: BoxDecoration(color: Colors.blue),),
                    ),
                  ),
                  const IgnorePointer(
                    ignoring: true,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text('deferToChild'),
                    ),
                  ),
                  Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerDown: (event) {
                      setState(() {
                        ++_redCount;
                      });
                    },
                    child: SizedBox(
                      width: 300,
                      height: 200,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 200,
                          height: 100,
                          decoration: const BoxDecoration(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  const IgnorePointer(
                    ignoring: true,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(58, 50, 0, 0),
                      child: Text('translucent'),
                    ),
                  ),
                ],
              ),
              Text('蓝色$_blueCount次        红色$_redCount次'),
            ],
          ),
        ),
      ),
    );
  }
}
