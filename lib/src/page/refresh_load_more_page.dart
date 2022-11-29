import 'package:flutter/material.dart';
import 'dart:math' as math;

class RefreshLoadMorePage extends StatefulWidget {
  static const pagePathName = 'refresh_load_more';
  const RefreshLoadMorePage({Key? key}) : super(key: key);

  @override
  State<RefreshLoadMorePage> createState() => _RefreshLoadMorePageState();
}

class _RefreshLoadMorePageState extends State<RefreshLoadMorePage> {
  final List<int> _dataList = [];
  static const int perPageCount = 30;
  static const int maxItemCount = 130;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData({bool isLoadMore = false}) async {
    if(!isLoadMore) _dataList.clear();
    int itemCount = math.min(_dataList.length + perPageCount, maxItemCount);
    int startIndex = isLoadMore ? math.min(_dataList.length, maxItemCount) : 0;
    for(; startIndex < itemCount; startIndex++) {
      _dataList.add(startIndex);
    }
    return await Future.delayed(const Duration(seconds: 1), () async {
      if(mounted) {
        setState(() {
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('下拉刷新 上拉加载更多', style: TextStyle(fontSize: 18),),
            Text('使用 scroll_to_index package', style: TextStyle(fontSize: 13),),
          ],
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadData,
          child: ListView.builder(
            restorationId: 'refresh_load_more1',
            itemCount: _dataList.length + (_dataList.length < maxItemCount ? 1 : 0),
            itemExtent: 80,
            itemBuilder: (context, index) {
              if(index < _dataList.length) {
                return Card(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('${index < perPageCount ? 'Refresh' : 'Load more'} item $index'),
                  ),
                );
              } else {
                Future.delayed(const Duration(milliseconds: 100), () {
                  if(mounted) _loadData(isLoadMore: true);
                });
                return const Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      valueColor:AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
