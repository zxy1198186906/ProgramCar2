import 'package:flutter/material.dart';
import 'package:helloworld/ICondition.dart';

class NewCasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewCasePageState();
}

class _NewCasePageState extends State<NewCasePage> {

  static const List<String> buttonText = ["earlier", "later", "lower", "higher", "on", "off"];
  List<Widget> _paramView = [];
  List<Widget> _equationView = [];

  static int _paramIndex = 0;
  static int _equationIndex = 0;
  static int _msgIndex = 0;
  static int _parameter = 20;

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

  @override
  void initState(){
    super.initState();
    _equationView..add(RaisedButton(
        color: Colors.grey,
        highlightColor: Colors.cyan,
        onPressed: (){setState(() async{
          switch(_msgIndex){
            case 50:
              _paramIndex = 1;
              break;
            case 51:
              _paramIndex = 2;
              break;
            case 52:
              _paramIndex = 3;
              break;
            case 60:
              _paramIndex = 3;
              break;
            case 61:
              _paramIndex = 3;
              break;
            case 62:
              _paramIndex = 3;
              break;
          };
        });
        }
    ))..add(RaisedButton(
        color: Colors.amber,
        child: Text(buttonText[0]),
        highlightColor: Colors.cyan,
        onPressed: (){setState(() async{
          _paramIndex = 1;
        });}
    ))..add(RaisedButton(
          color: Colors.amber,
          child: Text(buttonText[1]),
          onPressed: (){setState(() async{
            _paramIndex = 1;
          });}
    ))..add(RaisedButton(
          color: Colors.amber,
          child: Text(buttonText[2]),
          onPressed:(){setState(() async{
            _paramIndex = 2;
          });}
    ))..add(RaisedButton(
        color: Colors.amber,
        child: Text(buttonText[3]),
        onPressed: (){setState(() {
          _paramIndex = 2;
        });}
    ))..add(RaisedButton(
        color: Colors.amber,
        child: Text(buttonText[4]),
        onPressed: (){setState(() {
          _paramIndex = 3;
        });}
    ))..add(RaisedButton(
        color: Colors.amber,
        child: Text(buttonText[5]),
        onPressed: (){setState(() {
          _paramIndex = 3;
        });}
    ))..add(RaisedButton(
        color: Colors.amber,
        child: Text('${_parameter}'),
        onPressed: (){setState(() {
          _paramIndex = 4;
        });}
    ));

    _paramView..add(Container(
      height: 40,
      margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
    ))..add(Container(
      width: 320,
      height: 120,
      margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Potential Fills", style: TextStyle(color: Colors.green,
              fontSize: 18,
              fontWeight: FontWeight.bold)),
          Container(
            width: 240,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                    color: Colors.amber,
                    child: Text(buttonText[0]),
                    onPressed: (){ setState(() async{
                      _equationIndex = 1;
                    });}
                ),
                RaisedButton(
                    color: Colors.amber,
                    child: Text(buttonText[1]),
                    onPressed: () {
                      setState(() async{
                        _equationIndex = 2;
                      });
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    ))
    ..add(Container(
      height: 60,
      child: Column(
        children: <Widget>[
          Text("Potential Fills", style: TextStyle(color: Colors.green,
              fontSize: 22,
              fontWeight: FontWeight.bold)),
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                  color: Colors.amber,
                  child: Text(buttonText[2]),
                  onPressed: (){ setState(() {
                    setState(() {
                      _equationIndex = 3;
                    });
                  });}
              ),
              RaisedButton(
                  color: Colors.amber,
                  child: Text(buttonText[3]),
                  onPressed: () {
                    setState(() {
                      _equationIndex = 4;
                    });
                  }
              ),
            ],
          )
        ],
      ),
    ))
    ..add(Container(
      height: 60,
      child: Column(
        children: <Widget>[
          Text("Potential Fills", style: TextStyle(color: Colors.green,
              fontSize: 22,
              fontWeight: FontWeight.bold)),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                  color: Colors.amber,
                  child: Text(buttonText[4]),
                  onPressed: (){ setState(() {
                    _equationIndex = 5;
                  });}
              ),
              RaisedButton(
                  color: Colors.amber,
                  child: Text(buttonText[5]),
                  onPressed: () {
                    setState(() {
                      _equationIndex = 6;
                    });
                  }
              ),
            ],
          )
        ],
      ),

    ))
    ..add(paramField());
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
                                        onTap:() => showModalBottomSheet(
                                            context: context, 
                                            builder: (BuildContext context) => ifParam(ICondition.HANDLER_TIME)),
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
                                        onTap:() => showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) => ifParam(ICondition.HANDLER_TEMPERATURE)),
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
                                        onTap:() => showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) => ifParam(ICondition.HANDLER_NET)),
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
                                          onTap:() => showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) => ifParam(ICondition.HANDLER_CLOCK)),
                                          //onTap: ifParam(),
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
                                          onTap:() => showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) => ifParam(ICondition.HANDLER_MUSIC)),
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
                                          onTap:() => showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) => ifParam(ICondition.HANDLER_GPS)),
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
    _msgIndex = msgType;
    switch(msgType){
      case ICondition.HANDLER_TIME:
        return BottomSheet(
            onClosing: (){},
            builder: (BuildContext context){
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 6),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Select Category", style: TextStyle(color: Colors.grey, fontSize:17, fontWeight: FontWeight.bold)),
                          Text("Set Parameter", style: TextStyle(color: Colors.black, fontSize:17, fontWeight: FontWeight.bold))
                        ]),
                  ),
                  Image(image: new AssetImage("image/line.png")),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Image(image: AssetImage('image/time.png'), width: 60, height: 60)
                        ),
                        Expanded(
                            flex: 7,
                            child: Text("Time", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                        )
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 5, 10, 0),
                    child: Row(
                      children: <Widget>[
                        Text("If the time is    ", style: TextStyle(fontSize: 16)),
                        SizedBox(
                          width: 80,
                          child: _equationView[_equationIndex]
                        ),
                        Text("    than", style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(40, 5, 10, 5),
                          width: 80,
                          child: _equationView[7]
                      ),
                      Text("   O' Clock.", style: TextStyle(fontSize: 16))
                    ],
                  ),
                  Image(image: new AssetImage("image/line.png")),
                  _paramView[_paramIndex]
                ],
              );
            });
      case ICondition.HANDLER_TEMPERATURE:
        return BottomSheet(
            onClosing: (){},
            builder: (BuildContext context){
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 6),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Select Category", style: TextStyle(color: Colors.grey, fontSize:17, fontWeight: FontWeight.bold)),
                          Text("Set Parameter", style: TextStyle(color: Colors.black, fontSize:17, fontWeight: FontWeight.bold))
                        ]),
                  ),
                  Image(image: new AssetImage("image/line.png")),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 3,
                              child: Image(image: AssetImage('image/temper.png'), width: 70, height: 70)
                          ),
                          Expanded(
                              flex: 7,
                              child: Text("Temperature", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                          )
                        ],
                      )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 5, 10, 5),
                    child: Row(
                      children: <Widget>[
                        Text("If the temperature is    ", style: TextStyle(fontSize: 20)),
                        SizedBox(
                            width: 90,
                            child: _equationView[_equationIndex]),
                        Text("    than", style: TextStyle(fontSize: 20))
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(40, 5, 10, 5),
                          width: 90,
                          child: _equationView[_equationIndex]
                      ),
                      Text("   ℃.", style: TextStyle(fontSize: 20)),
                    ],
                  )
                ],
              );
            });
      case ICondition.HANDLER_NET:
        return BottomSheet(
            onClosing: (){},
            builder: (BuildContext context){
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 6),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Select Category", style: TextStyle(color: Colors.grey, fontSize:17, fontWeight: FontWeight.bold)),
                          Text("Set Parameter", style: TextStyle(color: Colors.black, fontSize:17, fontWeight: FontWeight.bold))
                        ]),
                  ),
                  Image(image: new AssetImage("image/line.png")),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 3,
                              child: Image(image: AssetImage('image/wifi.png'), width: 70, height: 70)
                          ),
                          Expanded(
                              flex: 7,
                              child: Text("Network", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                          )
                        ],
                      )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 5, 10, 5),
                    child: Row(
                      children: <Widget>[
                        Text("If the network is    ", style: TextStyle(fontSize: 20)),
                        SizedBox(
                            width: 90,
                            child: _equationView[_equationIndex]
                        ),
                      ],
                    ),
                  )
                ],
              );
            });
      case ICondition.HANDLER_CLOCK:
        return BottomSheet(
            onClosing: (){},
            builder: (BuildContext context){
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 6),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Select Category", style: TextStyle(color: Colors.grey, fontSize:17, fontWeight: FontWeight.bold)),
                          Text("Set Parameter", style: TextStyle(color: Colors.black, fontSize:17, fontWeight: FontWeight.bold))
                        ]),
                  ),
                  Image(image: new AssetImage("image/line.png")),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 3,
                              child: Image(image: AssetImage('image/clock.png'), width: 70, height: 70)
                          ),
                          Expanded(
                              flex: 7,
                              child: Text("Clock", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                          )
                        ],
                      )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 5, 10, 5),
                    child: Row(
                      children: <Widget>[
                        Text("then the clock is    ", style: TextStyle(fontSize: 20)),
                        SizedBox(
                            width: 90,
                            child: _equationView[_equationIndex]
                        ),
                      ],
                    ),
                  )
                ],
              );
            });
      case ICondition.HANDLER_MUSIC:
        return BottomSheet(
            onClosing: (){},
            builder: (BuildContext context){
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 6),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Select Category", style: TextStyle(color: Colors.grey, fontSize:17, fontWeight: FontWeight.bold)),
                          Text("Set Parameter", style: TextStyle(color: Colors.black, fontSize:17, fontWeight: FontWeight.bold))
                        ]),
                  ),
                  Image(image: new AssetImage("image/line.png")),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 3,
                              child: Image(image: AssetImage('image/music.png'), width: 70, height: 70)
                          ),
                          Expanded(
                              flex: 7,
                              child: Text("Music", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                          )
                        ],
                      )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 5, 10, 5),
                    child: Row(
                      children: <Widget>[
                        Text("then the music is    ", style: TextStyle(fontSize: 20)),
                        SizedBox(
                            width: 90,
                            child: _equationView[_equationIndex]
                        ),
                      ],
                    ),
                  )
                ],
              );
            });
      case ICondition.HANDLER_GPS:
        return BottomSheet(
            onClosing: (){},
            builder: (BuildContext context){
              return Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 6),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Select Category", style: TextStyle(color: Colors.grey, fontSize:17, fontWeight: FontWeight.bold)),
                          Text("Set Parameter", style: TextStyle(color: Colors.black, fontSize:17, fontWeight: FontWeight.bold))
                        ]),
                  ),
                  Image(image: new AssetImage("image/line.png")),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 3,
                              child: Image(image: AssetImage('image/location.png'), width: 70, height: 70)
                          ),
                          Expanded(
                              flex: 7,
                              child: Text("GPS", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                          )
                        ],
                      )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 5, 10, 5),
                    child: Row(
                      children: <Widget>[
                        Text("then the gps is    ", style: TextStyle(fontSize: 20)),
                        SizedBox(
                            width: 90,
                            child: _equationView[_equationIndex]
                        ),
                      ],
                    ),
                  )
                ],
              );
            });

    }
  }


  Widget paramField(){
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed:() => _parameter--
          ),
          SizedBox(
              width: 30,
              child: Text('${_parameter}', style: TextStyle(fontSize: 18))
          ),
          IconButton(
              icon: Icon(Icons.minimize),
              onPressed: () => _parameter++
          )
        ],
      ),
    );
  }
}
