import 'package:helloworld/RegexHelper.dart';
import 'package:flutter/services.dart';

abstract class ICondition{
  String _mDesText;
  int _mMsgType;
  int _mRelation;
  void setDesText(String desText){
    _mDesText = desText;
  }
  String getDesText() => _mDesText;

  void setMsgType(int msgType){
    _mMsgType = msgType;
  }
  int getMsgType() => _mMsgType;

  void setRelation(int relation){
    _mRelation = relation;
  }
  int getRelation() => _mRelation;

  bool find(int equation, int number);
}

class TimeCondtion extends ICondition{
  var _mContext;

  TimeCondtion(dynamic context){
    _mContext = context;
  }

  @override
  bool find(int equation, int hourTime) {
    // TODO: implement find
    var calendar = DateTime.now();
    int hour = calendar.hour;
    print("now the hour is $hour ");
    switch(equation){
      case RegexHelper.NUM_LESS:
        if(hour < hourTime)
          return true;
        break;
      case RegexHelper.NUM_MORE:
        if(hour > hourTime)
          return true;
        break;
    }
    return false;
  }
}

class TemperatureCondition extends ICondition {
  static const methodChannel = const MethodChannel("programcar.flutter.io/temperature");
  var _mContext;
  var _temperature;

  TemperatureCondition(var context){
    _mContext = context;
  }
  
  Future<Null> _getTemperature() async{
    try{
      var temperature = await methodChannel.invokeMethod("getTemperature");
      _temperature = temperature;
    }on PlatformException catch(e){
      print("get temperature failed : ${e.toString()}");
    }
  }

  @override
  bool find(int equation, int degree) {
    _getTemperature();
    switch (equation){
      case RegexHelper.NUM_LESS:
        if (_temperature < degree)
          return true;
        break;
      case RegexHelper.NUM_MORE:
        if (_temperature > degree)
          return true;
        break;
    }
    return false;
  }
}

class NetCondition extends ICondition{
  static const methodChannel = const MethodChannel("programcar.flutter.io/network");
  var _mContext;
  bool _isConnected;

  NetCondition(var context){
    _mContext = context;
  }

  Future<Null> _getNetwork() async{
    try {
      bool isConnected = await methodChannel.invokeMethod("getNetwork");
      _isConnected = isConnected;
    }on PlatformException catch (e){
      print("get network failed : ${e.toString()}");
    }
  }

  @override
  bool find(int equation, int state) {
    // TODO: implement find
    _getNetwork();
    switch (state){
      case RegexHelper.NUM_MORE:
        if (_isConnected)
          return true;
        break;
      case RegexHelper.NUM_LESS:
        if (! _isConnected)
          return true;
        break;
    }
    return false;
  }

}