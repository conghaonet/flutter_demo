import 'package:flutter/material.dart';
import 'package:flutter_demo/src/home.dart';
import 'package:material_color_utilities/scheme/scheme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// 类似 Android 中 onSaveInstanceState 的实现。
      /// 当系统"未经你许可" 时销毁了你的 Activity 时，比如横竖屏切换、点击 Home 键。
      /// 系统会通过 onSaveInstanceState 回调来你保存临时状态数据，这样可以保证下次用户进入时保持退出先的界面。
      restorationScopeId: 'app',
      theme: ThemeData(
        /// 使用 Material3 样式
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),

      ),
      home: const HomePage(),
    );
  }

}
