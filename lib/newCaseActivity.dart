import 'package:flutter/material.dart';

class NewCasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewCasePageState();
}

class _NewCasePageState extends State<NewCasePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: Text("Add New Case", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black38,
        ),
        body:
        Column(
            children: <Widget>[editText()]
        )
    );
  }

  Widget editText() {
    return new Container(
      width: 360,
      height: 50,
      padding: EdgeInsets.fromLTRB(20, 5.0, 0, 0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child:Text("//", style: TextStyle(color: Colors.green, fontSize: 32, fontWeight:FontWeight.bold)),
            flex: 1,
          ),
          Expanded(
            child:TextField(style: TextStyle(fontSize: 24), maxLines:1),
            flex: 9,
          )
        ],
      )
    );
  }
}
