import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/news_screen.dart';

const apiKey = '89f673e5bb764c75b27c55a23caaaf6f';
String imgURL;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  dynamic loading = SpinKitFadingCube(
    color: Colors.black,
    size: 100.0,
  );

  Future getData() async {
    http.Response response = await http.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=$apiKey');
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data)['articles'];
      imgURL = decodedData[0]['urlToImage'];
      setState(() {
        loading = NewsScreen(
          newsData: decodedData,
        );
      });
    } else {
      print(response.statusCode);
      setState(() {
        loading = Text('Unable to Fetch');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading,
      ),
    );
  }
}
