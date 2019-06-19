import 'package:flutter/material.dart';
import 'package:helloworld/fragment.dart';
import 'package:helloworld/newCaseActivity.dart';

class NavigationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage>{
  final _navigationColorPressed = Colors.lightBlue;
  final _navigationColorUnpressed = Colors.white;
  int _currentIndex = 0;

  List<Widget> pageList;
  MaterialButton newButton;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("PMyCar", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black38,

      ),
      body:
      pageList[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: changeNewState),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black38,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.cloud, color: _currentIndex == 0? _navigationColorPressed : _navigationColorUnpressed),
                title: Text('Top', style: TextStyle(color: _currentIndex == 0? _navigationColorPressed : _navigationColorUnpressed))),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility, color: _currentIndex == 1? _navigationColorPressed : _navigationColorUnpressed),
                title: Text('My', style: TextStyle(color: _currentIndex == 1? _navigationColorPressed : _navigationColorUnpressed))
            )
          ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      )


    );
  }

  @override
  void initState(){
    super.initState();
    pageList = new List();
    pageList..add(TopFragment())
            ..add(MyFragment());
  }

  void changeNewState(){
    Route route = new MaterialPageRoute(builder: (context) => new NewCasePage());
    Navigator.push(context, route);
  }

}