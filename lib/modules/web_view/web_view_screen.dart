import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final  controller = WebViewController()
  ..setJavaScriptMode(javaScriptMode.disabled)
  ..loadRequest("uri");
 // String filePath = 'assets/index.html';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller)
    );
  }
}
