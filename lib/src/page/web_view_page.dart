import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  static const pagePathName = 'web_view_page';
  final String? link;
  final String? title;
  const WebViewPage({Key? key, required this.link, this.title}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  late String _title;
  late String _link;
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _title = widget.title ?? 'Flutter';
    _link = widget.link ?? 'https://flutter.dev';
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if(_controller.isCompleted) {
              try {
                var controller = await _controller.future;
                if(await controller.canGoBack()) {
                  controller.goBack();
                  return false;
                }
              } catch(e) {
                return true;
              }
            }
            return true;
          },
          child: Stack(
            children: [
              WebView(
                initialUrl: _link,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
                javascriptMode: JavascriptMode.unrestricted,
                onProgress: (int progress) {
                  setState(() {
                    _progress = progress.toDouble() / 100;
                  });
                  debugPrint('WebView is loading (progress : $progress%)');
                },
                javascriptChannels: <JavascriptChannel>{
                  _toasterJavascriptChannel(context),
                },
                onPageStarted: (String url) {
                  _link = url;
                  debugPrint('Page started loading: $url');
                },
                onPageFinished: (String url) {
                  debugPrint('Page finished loading: $url');
                },
                gestureNavigationEnabled: true,
                backgroundColor: const Color(0x00000000),
              ),
              Offstage(
                offstage: _progress == 1.0,
                child: LinearProgressIndicator(
                  value: _progress,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent), // 进度条颜色为粉色
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildRefresh(),
    );
  }

  Widget _buildRefresh() {
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder: (context, controller) {
        return FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () async {
            if(controller.connectionState == ConnectionState.done) {
              await controller.data?.reload();
            }
          },
        );
      },
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }


}
