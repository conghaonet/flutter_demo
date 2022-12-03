import 'package:flutter/material.dart';

class ClipDemoPage extends StatelessWidget {
  static const pagePathName = 'clip_demo';
  static const assetImage = 'assets/butterfly.jpg';
  static const divider = 12.0;
  const ClipDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('多种圆角实现'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('原图800x450 (16:9)'),
                Image.asset(
                  assetImage,
                  width: 288,
                  height: 162,
                ),
                const SizedBox(height: divider,),
                const Text('ClipRRect圆角'),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                  child: Image.asset(
                    assetImage,
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(height: divider,),
                const Text('BoxDecoration对DecorationImage的圆角'),
                Container(
                  height: 100,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(assetImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                ),
                const SizedBox(height: divider,),
                const Text('BoxDecoration对child圆角无效'),
                Container(
                  height: 100,
                  width: 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  child: Image.asset(assetImage),
                ),
                const SizedBox(height: divider,),
                const Text('BoxDecoration对背景圆角有效'),
                Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(assetImage),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
