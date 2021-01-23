import "package:flutter/material.dart";

import 'testingApi.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String textToSearch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 10.0, right: 15.0, left: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "WORDDEF&MORE",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    textToSearch = value;
                  });
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                  hintText: "Input Text",
                  hintStyle:
                      TextStyle(color: Color(0xff666666), fontSize: 14.0),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
            ),
            RaisedButton(
                onPressed: () => textToSearch.isNotEmpty
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TestingApi(
                                  searchedWord: textToSearch,
                                )))
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("CheckOut"),
                ))
          ],
        ),
      ),
    );
  }
}
