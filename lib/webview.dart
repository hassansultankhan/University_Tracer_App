import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview_widget extends StatefulWidget {
  String website = "";
  String uniname = "";
  webview_widget(this.website, this.uniname);

  @override
  State<webview_widget> createState() => _webview_widgetState();
}

class _webview_widgetState extends State<webview_widget> {
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.uniname),
        centerTitle: true,
      ),
      body: Column(children: [
        LinearProgressIndicator(
          backgroundColor: Color.fromARGB(255, 245, 218, 250),
          color: Color.fromARGB(255, 172, 5, 244),
          value: progress,
        ),
        Container(
            child: Expanded(
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            zoomEnabled: true,
            initialUrl: widget.website,
            onProgress: (progress) =>
                setState(() => (this.progress = progress / 100)),
          ),
        )),
      ]),
    );
  }
}
