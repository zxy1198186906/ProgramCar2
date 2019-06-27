import 'package:flutter/material.dart';
import 'package:helloworld/ICondition.dart';

class NewCasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewCasePageState();
}

class _NewCasePageState extends State<NewCasePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey,
        appBar: new AppBar(
          title: Text("Add New Case", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black45,
        ),
        body:
        Column(
            children: <Widget>[
              editText(),
              ifText(),
              thenText()
            ]
        ),
      //backgroundColor: Colors.black12
    );
  }

  Widget editText() {
    return new Container(
      width: 360,
      height: 50,
      padding: EdgeInsets.fromLTRB(18, 5, 0, 0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child:Text("//", style: TextStyle(color: Colors.green, fontSize: 30, fontWeight:FontWeight.bold)),
            flex: 1,
          ),
          Expanded(
            child:TextField(style: TextStyle(color: Colors.green, fontSize: 24), maxLines:1),
            flex: 9,
          )
        ],
      )
    );
  }

  Widget ifText() {
    return new Container(
        color: Colors.black,
        margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
        padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("If", style: TextStyle(color: Colors.green, fontSize: 27, fontWeight:FontWeight.bold, fontStyle: FontStyle.italic)),
            //ListView.builder(itemBuilder: null),
            Container(
              width: 300,
              height: 25,
              color: Colors.grey,
              child: FlatButton(
                  child: Text("+ Add New Trigger", style: TextStyle(color: Colors.white, fontSize: 14)),
                  onPressed: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context){
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 6),
                                child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text("Select Category", style: TextStyle(color: Colors.black, fontSize:17, fontWeight: FontWeight.bold)),
                                    Text("Set Parameter", style: TextStyle(color: Colors.grey, fontSize:17, fontWeight: FontWeight.bold))
                                  ]),
                              ),
                              Image(image: new AssetImage("image/line.png")),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    GestureDetector(
                                      child: Container(
                                        width: 90,
                                        height: 100,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Image(
                                              width: 70,
                                              height: 70,
                                              image: AssetImage('image/time.png'),),
                                            Text('Time', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold))
                                          ],
                                        ),
                                      )
                                    ),
                                    GestureDetector(
                                        child: Container(
                                          width: 90,
                                          height: 100,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Image(
                                                width: 70,
                                                height: 70,
                                                image: AssetImage('image/temper.png'),),
                                              Text('Temperature', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold))
                                            ],
                                          ),
                                        )
                                    ),
                                    GestureDetector(
                                        child: Container(
                                          width: 90,
                                          height: 100,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Image(
                                                width: 70,
                                                height: 70,
                                                image: AssetImage('image/wifi.png'),),
                                              Text('Network', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold))
                                            ],
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                  })
            ),
            Container(
                width: 300,
                height: 25,
                margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                color: Colors.grey,
                child: FlatButton(
                    child: Text("- Remove Trigger", style: TextStyle(color: Colors.white, fontSize: 14)),
                    onPressed: null)
            ),
          ],
        )
    );
  }

  Widget thenText() {
    return new Container(
        color: Colors.black,
        margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
        padding: EdgeInsets.fromLTRB(8, 8, 8, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Then", style: TextStyle(color: Colors.green, fontSize: 27, fontWeight:FontWeight.bold, fontStyle: FontStyle.italic)),
            //ListView.builder(itemBuilder: null),
            Container(
                width: 300,
                height: 25,
                color: Colors.grey,
                child: FlatButton(
                    child: Text("+ Add New Action", style: TextStyle(color: Colors.white, fontSize: 14)),
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context){
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 6),
                                  child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text("Select Category", style: TextStyle(color: Colors.black, fontSize:17, fontWeight: FontWeight.bold)),
                                        Text("Set Parameter", style: TextStyle(color: Colors.grey, fontSize:17, fontWeight: FontWeight.bold))
                                      ]),
                                ),
                                Image(image: new AssetImage("image/line.png")),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Container(
                                            width: 90,
                                            height: 100,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Image(
                                                  width: 70,
                                                  height: 70,
                                                  image: AssetImage('image/clock.png'),),
                                                Text('Clock', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold))
                                              ],
                                            ),
                                          )
                                      ),
                                      GestureDetector(
                                          child: Container(
                                            width: 90,
                                            height: 100,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Image(
                                                  width: 70,
                                                  height: 70,
                                                  image: AssetImage('image/music.png'),),
                                                Text('Music', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold))
                                              ],
                                            ),
                                          )
                                      ),
                                      GestureDetector(
                                          child: Container(
                                            width: 90,
                                            height: 100,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Image(
                                                  width: 70,
                                                  height: 70,
                                                  image: AssetImage('image/location.png'),),
                                                Text('GPS', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold))
                                              ],
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                    })
            ),
            Container(
                width: 300,
                height: 25,
                margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                color: Colors.grey,
                child: FlatButton(
                    child: Text("- Remove Action", style: TextStyle(color: Colors.white, fontSize: 14)),
                    onPressed: null)
            ),
          ],
        )
    );
  }

  Widget ifParam(int msgType){
    switch(msgType){
      case ICondition.HANDLER_TIME:
        return null;
    }
  }

}
