import 'package:flutter/material.dart';
import 'constants.dart';

class MoreInfo extends StatelessWidget {
  final data;
  final String searchedWord;
  final String pronunciation;
  const MoreInfo({
    Key key,
    this.searchedWord,
    this.data,
    this.pronunciation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    toList(List list) {
      return Container(
        child: list.length != null
            ? ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  var word = "${list[index]}".inCaps;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text("${index + 1}. $word",
                        style: TextStyle(fontSize: 18.0)),
                  );
                },
                shrinkWrap: true,
              )
            : SizedBox.shrink(),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
            iconSize: 40.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(searchedWord.inCaps,
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600)),
              Text(
                data["partOfSpeech"],
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic),
              ),
              Text("/$pronunciation/"),
              Divider(),
              Text(
                "Definition:",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
              ),
              Text("${data["definition"]}".inCaps,
                  style: TextStyle(fontSize: 18.0)),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Examples:",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
              ),
              data["examples"] != null
                  ? toList(data["examples"])
                  : SizedBox.shrink(),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Synonyms:",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
              ),
              data["synonyms"] != null
                  ? toList(data["synonyms"])
                  : SizedBox.shrink(),
            ],
          ),
        ));
  }
}
