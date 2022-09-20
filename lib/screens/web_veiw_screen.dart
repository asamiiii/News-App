import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebVeiwScreen extends StatelessWidget {
  //WebVeiwScreen({ Key? key }) : super(key: key);

  String? url;

  WebVeiwScreen(this.url, {Key? key}) : super(key: key);

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
