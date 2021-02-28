import 'dart:convert';
import 'constants.dart';
import 'header.dart';
import 'moreInfo.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';

class TestingApi extends StatefulWidget {
  final String searchedWord;

  const TestingApi({Key key, this.searchedWord}) : super(key: key);
  @override
  _TestingApiState createState() => _TestingApiState();
}

class _TestingApiState extends State<TestingApi> {
  var data;
  @override
  void initState() {
    super.initState();
    fetchData(widget.searchedWord);
  }

  fetchData(String searchedWord) async {
    final String url = "https://wordsapiv1.p.rapidapi.com/words/$searchedWord";
    var res = await http.get(url, headers: headers);
    print(res.body);
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Text("${widget.searchedWord.toUpperCase()}",
                  style: TextStyle(color: Colors.black)),
              data != null
                  ? Text("/${data["pronunciation"]["all"]}/",
                      style: TextStyle(color: Colors.grey[500]))
                  : SizedBox.shrink(),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: data != null
            ? Container(
                child: ListView.builder(
                itemCount: data["results"].length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoreInfo(
                                  data: data["results"][index],
                                  searchedWord: widget.searchedWord,
                                  pronunciation: data["pronunciation"]["all"],
                                ),
                              ));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                            padding:
                                EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 1),
                              )
                            ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${data["results"][index]["definition"]}"
                                        .inCaps,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    )),
                                Text(data["results"][index]["partOfSpeech"],
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey[400])),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text("tap for more...",
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.blueAccent,
                                      )),
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10.0,
                      )
                    ],
                  );
                },
              ))
            : CircularProgressIndicator(),
      ),
    );
  }
}