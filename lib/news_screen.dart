import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/news_snippet.dart';
import 'package:news_app/news_webframe.dart';

class NewsScreen extends StatefulWidget {
  final newsData;
  NewsScreen({this.newsData});
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<Widget> listView = [];

  void updateUI(dynamic newsData) {
    print(newsData.length);
    for (int i = 0; i < newsData.length; ++i) {
      setState(() {
        listView.add(GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return NewsWeb(
                    url: newsData[i]["url"],
                  );
                },
              ),
            );
          },
          child: NewsSnippet(
            data: widget.newsData[i],
          ),
        ));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.newsData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: listView,
      ),
    );
  }
}
