import 'package:flutter/material.dart';

class HitTestBehaviorPage extends StatefulWidget {
  static const pagePathName = 'hit_test_behavior';
  const HitTestBehaviorPage({Key? key}) : super(key: key);

  @override
  State<HitTestBehaviorPage> createState() => _HitTestBehaviorPageState();
}

class _HitTestBehaviorPageState extends State<HitTestBehaviorPage> {
  int _blue1Count = 0;
  int _red1Count = 0;

  int _blue2Count = 0;
  int _red2Count = 0;

  int _blue3Count = 0;
  int _red3Count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HitTestBehavior'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('请分别触摸红色、蓝色区域，以测试 HitTestBehavior',),
                ),
                const SizedBox(height: 32,),
                ..._buildRegion(HitTestBehavior.deferToChild),
                const Divider(height: 32,),
                ..._buildRegion(HitTestBehavior.opaque),
                const Divider(height: 32,),
                ..._buildRegion(HitTestBehavior.translucent),
                const SizedBox(height: 40,),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _blue1Count = 0;
            _red1Count = 0;
            _blue2Count = 0;
            _red2Count = 0;
            _blue3Count = 0;
            _red3Count = 0;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  List<Widget> _buildRegion(HitTestBehavior behavior) {
    int blueCount = 0;
    int redCount = 0;
    String behaviorName = '';
    switch(behavior) {
      case HitTestBehavior.deferToChild:
        blueCount = _blue1Count;
        redCount = _red1Count;
        behaviorName = 'deferToChild';
        break;
      case HitTestBehavior.opaque:
        blueCount = _blue2Count;
        redCount = _red2Count;
        behaviorName = 'opaque';
        break;
      case HitTestBehavior.translucent:
        blueCount = _blue3Count;
        redCount = _red3Count;
        behaviorName = 'translucent';
        break;
    }

    return <Widget>[
      Stack(
        alignment: Alignment.topCenter,
        children: [
          Listener(
            onPointerDown: (event) {
              setState(() => _setCounter(behavior, Colors.blue));
            },
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(300.0, 200.0)),
              child: const DecoratedBox(decoration: BoxDecoration(color: Colors.blue),),
            ),
          ),
          Listener(
            behavior: behavior,
            onPointerDown: (event) {
              setState(() => _setCounter(behavior, Colors.red));
            },
            child: SizedBox(
              width: 300,
              height: 200,
              child: Center(
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: const BoxDecoration(color: Colors.red),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: IgnorePointer(
              ignoring: true,
              child: Text(behaviorName),
            ),
          ),
        ],
      ),
      Text('蓝色$blueCount次        红色$redCount次'),
    ];
  }

  void _setCounter(HitTestBehavior behavior, Color color) {
    switch(behavior) {
      case HitTestBehavior.deferToChild:
        if(color == Colors.blue) {
          ++_blue1Count;
        } else if(color == Colors.red) {
          ++ _red1Count;
        }
        break;
      case HitTestBehavior.opaque:
        if(color == Colors.blue) {
          ++_blue2Count;
        } else if(color == Colors.red) {
          ++ _red2Count;
        }
        break;
      case HitTestBehavior.translucent:
        if(color == Colors.blue) {
          ++_blue3Count;
        } else if(color == Colors.red) {
          ++ _red3Count;
        }
        break;
    }
  }
}
