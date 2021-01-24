import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class NewsWeb extends StatelessWidget {
  final String url;
  NewsWeb({this.url});

  // String parseUrl() {
  //   if (url.contains("youtube.com")) {
  //     List<String> a = url.split("=");
  //     print("${a[1]}");
  //     String updatedUrl = "https://www.youtube.com/embed/${a[1]}";
  //     return updatedUrl;
  //   }
  //   return url;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 40.0,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GestureDetector(
        // onHorizontalDragUpdate: (updateDetails) {},
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
