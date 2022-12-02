import 'package:flutter/material.dart';

class InheritedWidgetDemoPage extends StatefulWidget {
  static const pagePathName = 'inherited_widget_demo';
  const InheritedWidgetDemoPage({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetDemoPage> createState() => _InheritedWidgetDemoPageState();
}

class _InheritedWidgetDemoPageState extends State<InheritedWidgetDemoPage> {
  /// 测试用数据
  final Person _person = Person(name: 'cong ming', age: 5, gender: 'Male');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget Demo'),
      ),
      body: Happy(
        person: _person,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 40,),
              Text(Happy.of(context)?.name ?? '没找到[Happy]'),
              const SizedBox(height: 40,),
              Builder(builder: (context) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('名字: ${Happy.of(context)?.name ?? ''}'),
                        Text('年龄: ${Happy.of(context)?.age ?? '-'}岁'),
                        Text('性别: ${Happy.of(context)?.gender ?? '未知'}'),
                      ],
                    ),
                    const SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Person? person = Happy.of(context);
                            if(person != null) {
                              setState(() {
                                ++person.age;
                              });
                            }
                          },
                          child: const Text('年龄 +1'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Person? person = Happy.of(context);
                            if(person != null) {
                              setState(() {
                                person.gender == 'Male' ? person.gender = 'Female' : person.gender = 'Male';
                              });
                            }
                          },
                          child: const Text('变更性别'),
                        ),
                      ],
                    ),
                  ],
                );
              },),
            ],
          ),
        ),
      ),
    );
  }
}


/// 自定义 Widget
class Happy extends StatelessWidget {
  final Person person;
  final Widget child;
  const Happy({
    super.key,
    required this.person,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return _InheritedHappy(
      person: person,
      child: child,
    );
  }

  static Person? of(BuildContext context) {
    final _InheritedHappy? inheritedTheme = context.dependOnInheritedWidgetOfExactType<_InheritedHappy>();
    return inheritedTheme?.person;
  }
}


/// 自定义 InheritedWidget
class _InheritedHappy extends InheritedWidget {
  final Person person;
  const _InheritedHappy({
    super.key,
    required this.person,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant _InheritedHappy oldWidget) {
    return oldWidget.person.name != person.name
        || oldWidget.person.age != person.age
        || oldWidget.person.gender != person.gender;
  }
}

/// 测试用模型
class Person {
  String? name;
  int age;
  String gender;
  Person({required this.name, this.age = 1, this.gender = 'Male'});
}