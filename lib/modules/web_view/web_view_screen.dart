
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView_screen extends StatelessWidget {

   final String? url;
  WebView_screen(this.url);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
