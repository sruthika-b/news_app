import 'package:flutter/material.dart';

class NewsSnippet extends StatelessWidget {
  final data;

  dynamic dateTime(DateTime a) {
    var now = new DateTime.now();
    Duration b = now.difference(a);
    var timeList = b.toString().split(":");
    var ans = "";
    print(timeList);
    if (timeList[0] != "0") {
      if (timeList[0] == "1") {
        ans = "1 hour ";
      } else {
        ans = "${timeList[0]} hours ";
      }
    }
    if (timeList[1] != "00") {
      if (timeList[1] == "01") {
        ans += "1 minute";
      } else if (timeList[1][0] == "0") {
        ans += "${timeList[1][1]} minutes";
      } else {
        ans += "${timeList[1]} minutes";
      }
    }
    ans += " ago";
    return ans;
  }

  NewsSnippet({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 3.0, color: Colors.black),
                  left: BorderSide(width: 3.0, color: Colors.black),
                  right: BorderSide(width: 3.0, color: Colors.black),
                  bottom: BorderSide(width: 3.0, color: Colors.black),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Image(
                  image: NetworkImage(data['urlToImage']),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              data['title'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.remove_red_eye),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('7.5M'),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('|'),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '#cricket',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(dateTime(DateTime.parse(data["publishedAt"]))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
