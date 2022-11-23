import 'package:flutter/material.dart';

class ImageCachePage extends StatefulWidget {
  static const pagePathName = 'image_cache';
  const ImageCachePage({Key? key}) : super(key: key);

  @override
  State<ImageCachePage> createState() => _ImageCachePageState();
}

class _ImageCachePageState extends State<ImageCachePage> {
  int _picNum = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网络图片缓存'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                'https://gitee.com/conghaonet/pictures/raw/master/wallpaper/$_picNum.jpg',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  debugPrint("ERROR picNum is $_picNum");
                  debugPrintStack(stackTrace: stackTrace);
                  return const Icon(Icons.error,);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    var imageCache = PaintingBinding.instance.imageCache;
                    _showMessage('ImageCache\ncurrentSize: ${imageCache.currentSize}\ncurrentSizeBytes: ${imageCache.currentSizeBytes}');
                  },
                  child: const Text('查看缓存'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final imageUrl = 'https://gitee.com/conghaonet/pictures/raw/master/wallpaper/$_picNum.jpg';
                    final imageCache = PaintingBinding.instance.imageCache;
                    final image = NetworkImage(imageUrl, scale: 1.0);
                    bool evictResult = imageCache.evict(image);
                    _showMessage("${evictResult ? '【缓存已删除】' : '【没找到缓存，删除失败！】'}\n$imageUrl");
                  },
                  child: const Text('删除缓存'),
                ),
              ],
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () => setState(() => --_picNum),
                  child: const Text('上一张'),
                ),
                Text('$_picNum'),
                OutlinedButton(
                  onPressed: () => setState(() => ++_picNum),
                  child: const Text('下一张'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
          action: SnackBarAction(
            textColor: Theme.of(context).colorScheme.inversePrimary,
            label: 'ok',
            onPressed: () => {},
          ),
        )
    );
  }
}
